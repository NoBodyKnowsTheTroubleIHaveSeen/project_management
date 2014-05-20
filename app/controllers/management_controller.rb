class ManagementController < ApplicationController
  require 'date'
  layout false

  #项目管理
  def project_management
    get_projects
    @has_priviliege = session[:is_manager]
  end

  def goto_add_project
    @people = Person.where.not(priviliege: 15)
  end

  def add_project
    project = Project.new
    project.name = params[:name]
    project.start_date = params[:start_date]
    project.finish_date = params[:finish_date]
    project.description = params[:description]
    project.manager_id = session[:people_id]
    if project.valid?
      project.save
      id = project.id
      array = params[:idList]
      if !array.blank?
        array.each do |value|
          person_project = PersonProject.new
          person_project.project_id = id
          person_project.role = 1
          person_project.role_name = 'developer'
          person_project.people_id = value
          person_project.save
        end
      end
      manager = PersonProject.new
      manager.project_id = id
      manager.role = 15
      manager.role_name = 'manager'
      manager.people_id = session[:people_id]
      manager.save
      redirect_to :action => 'project_management'
      return
    end
    render :text => 'error'
  end

  def goto_update_project
    @people = Person.all
    get_peopple_by_project_id
    if !session[:is_manager]
      render :show_project
    end
  end

  def update_project
    project = Project.find params[:project_id]
    project.name = params[:name]
    project.description= params[:description]
    puts params[:description]
    project.start_date = params[:start_date]
    project.finish_date = params[:finish_date]
    if project.valid?
      project.save
      idList = params[:idList]
      idList.each do |value|
        person_project = PersonProject.where("project_id = ? and people_id = ?", params[:project_id], value)
        if person_project.blank?
          person_project = PersonProject.new
          person_project.project_id = params[:project_id]
          person_project.role = 1
          person_project.role_name = 'developer'
          person_project.people_id = value
          person_project.save
        end
      end
      removeIdList = params[:removeIdList]
      if !removeIdList.blank?
        removeIdList.each do |value|
          person_project = PersonProject.find_by(project_id: params[:project_id], people_id: value)
          person_project.destroy
        end
      end
      redirect_to :action => 'project_management'
      return
    end
    render :text => 'error'
  end

  def delete_project
    project = Project.find params[:project_id]
    project.destroy
    redirect_to :action => :project_management
  end

  #获得项目人员
  def get_project_people
    get_peopple_by_project_id
  end

  def plan
    get_plans
  end

  def goto_add_plan
    @plan = Plan.new
    @create_date = Time.now
    get_task_name_and_id
  end

  def add_plan
    plan = Plan.new plan_param
    if plan.valid?
      plan.save
      redirect_to :action => :plan
      return
    end
    plan.errors.each do |a|
      puts a
    end
    render :text => "error"
  end

  def goto_update_plan
    @plan = Plan.find params[:plan_id]
    get_task_name_and_id
  end

  def update_plan
    plan = Plan.find params[:plan][:id]
    plan.update_attributes plan_param
    redirect_to :action => :plan
  end

  def delete_plan
    plan = Plan.find params[:plan][:id]
    plan.destroy
    redirect_to :action => :plan
  end

  def task_distribute
    get_tasks
    @has_priviliege = session[:is_manager]
  end

  #添加任务
  def goto_add_task
    #用户只能给自己的项目添加任务
    @projects = Project.where(manager_id: session[:people_id])
  end

  def add_task
    task = Task.new
    task.name = params[:name]
    task.project_id = params[:project_id]
    task.start_date = params[:start_date]
    task.weight = params[:weight]
    task.description = params[:description]
    task.hard_level = params[:hard_level]
    if task.valid?
      task.save
    else
      render :text => 'error'
      return
    end
    idList = params[:idList]
    idList.each do |value|
      personTask = PersonTask.new
      personTask.people_id= value
      personTask.task_id= task.id
      personTask.start_time = params[:start_date]
      personTask.project_id= params[:project_id]
      if personTask.valid?
        personTask.save
      end
    end
    redirect_to :action => :task_distribute
    return
  end

  def goto_update_task
    task_id = params[:task_id]
    @task = Task.find task_id
    project = Project.find @task.project_id
    @project_name = project.name
    people_id_list = PersonTask.where("task_id = ?", @task.id)
    @people = Array.new
    people_id_list.each do |value|
      @people.append Person.find value.people_id
    end
    #判断是否有该分发任务的权利
    has_priviliege = project.manager_id == session[:people_id]
    if !has_priviliege
      render :show_task
    end
  end

  def update_task
    task = Task.find params[:task_id]
    task.name = params[:name]
    task.project_id = params[:project_id]
    task.start_date = params[:start_date]
    task.weight = params[:weight]
    task.description = params[:description]
    task.hard_level = params[:hard_level]
    if task.valid?
      task.save
      idList = params[:idList]
      if !idList.blank?
        idList.each do |value|
          person_task = PersonTask.where("task_id = ? and people_id = ?", params[:task_id], value)
          if person_task.blank?
            person_task = PersonTask.new
            person_task.people_id= value
            person_task.task_id= task.id
            person_task.start_time = params[:start_date]
            person_task.project_id= params[:project_id]
            if person_task.valid?
              person_task.save
            end
          end
        end
      end
      removeIdList = params[:removeIdList]
      if !removeIdList.blank?
        removeIdList.each do |value|
          pesron_task = PersonTask.find_by(task_id: params[:task_id], people_id: value)
          pesron_task.destroy
        end
      end
      redirect_to :action => :task_distribute
      return
    end
    render :text => 'error'
    return
  end

  def delete_task
    task = Task.find params[:task_id]
    task.destroy
    @tasks = Task.all
    render :task_distribute
  end


  def schedule_submit
    @schedule = Schedule.new
    all_task_ids = PersonTask.where(people_id: session[:people_id]).select(:task_id).distinct
    @task_ids = Array.new
    @task_names = Array.new
    if !all_task_ids.blank?
      all_task_ids.each do |value|
        task = Task.find value.task_id
        if task.percentage != 100
          @task_ids.append value.task_id
          @task_names.append(task.name)
        end
      end
    end
    @plans = Plan.where(people_id: session[:people_id], is_done: 0)
  end

  def add_schedule
    schedule = Schedule.create schedule_param
    if schedule.valid?
      schedule.save
    else
      render :text => "error"
      return
    end
    shcedule_param = params[:schedule]
    if !schedule_param[:plan_id].blank?&&schedule_param[:plan_id]!="0"
      plan_id = schedule_param[:plan_id]
      plan_is_done = schedule_param[:plan_is_done]
      plan = Plan.find plan_id
      plan.is_done = plan_is_done
      plan.finish_date = Time.now
      plan.save
    end
    task_id = schedule_param[:task_id]
    if !task_id.blank?&&task_id!="0"
      task = Task.find task_id
      complete_percentage = schedule_param[:complete_percentage].to_i
      old_percentage = task.percentage.to_i
      project_add_percentage = (complete_percentage-old_percentage)*task.weight/100
      project = Project.find task.project_id
      project_old_percentage = project.finish_percentage
      finish_percentage = project_old_percentage+project_add_percentage
      project.finish_percentage = finish_percentage
      if finish_percentage == 100
        project.is_done = 1
        project.finish_date = Time.now
      end
      task.percentage = complete_percentage
      if complete_percentage == 100
        task.end_date = Time.now
      end
      task.save
      project.save
    end
    redirect_to :action => :show_schedule, :id => schedule.id
  end

  def goto_show_schedule
    get_schedules
    @has_priviliege = session[:is_manager]
    if @has_priviliege
      manager_get_projects
    end
  end

  def show_schedule
    get_schedule_by_params
    @has_delete_privilege = session[:people_id] == params[:id]
    @has_advice_privilege = session[:is_manager]
  end

  def delete_schedule
    get_schedule_by_params
    @schedule.destroy
    redirect_to :action => :goto_show_schedule
  end

  def goto_schedule_control
    project_id = params[:project_id]
    tasks = Task.where(project_id: project_id)
    @schedules = Array.new
    if !tasks.blank?
      tasks.each do |value|
        tempSchedules = Schedule.where(task_id: value.id)
        if !tempSchedules.blank?
          tempSchedules.each do |value|
            @schedules.append value
          end
        end
      end
    end
  end

  def advice_for_schedule
    schedule_id = params[:schedule_id]
    schedule = Schedule.find schedule_id
    schedule.advice= params[:advice]
    schedule.save
    render :text => "success"
    #redirect_to :action => :show_schedule, :id => schedule_id
  end


  def schedule_summary
    get_projects
    get_plans
    get_tasks
  end

  private
  def get_projects
    #根据登陆的员工id找到其对应的项目
    personProject = PersonProject.where(people_id: session[:people_id]).select(:project_id).distinct
    @projects = Array.new
    if !personProject.blank?
      personProject.each do |value|
        @projects.append Project.find value.project_id
      end
    end
  end

  #通过项目id获得项目人员
  def get_peopple_by_project_id
    @project_id = params[:project_id]
    @project = Project.find @project_id
    personProject = PersonProject.where("project_id = ?", @project_id).select(:people_id).distinct
    @project_people = Array.new
    personProject.each do |value|
      p = Person.find value.people_id
      @project_people.append p.id
      @project_people.append p.name
    end
  end

  def plan_param
    params.require(:plan).permit!
  end

  def get_plans
    @plans = Plan.where(people_id: session[:people_id])
  end

  def get_task_name_and_id
    @task_ids = PersonTask.where(people_id: session[:people_id]).select(:task_id).distinct
    @task_names = Array.new
    if !@task_ids.blank?
      @task_ids.each do |value|
        task = Task.find value.task_id
        @task_names.append(task.name)
      end
    end
  end

  def get_tasks
    #获得该人参与的所有项目Id
    project_ids = get_project_ids_by_people_id session[:people_id]
    @tasks = Array.new
    if !project_ids.blank?
      project_ids.each do |value|
        #遍历，找到项目相关的所有任务
        tasks = Task.where(project_id: value.project_id)
        if !tasks.blank?
          tasks.each do |value|
            @tasks.append value
          end
        end
      end
    end
  end

  def get_project_ids_by_people_id people_id
    PersonProject.where(people_id: people_id).select(:project_id).distinct
  end

  def schedule_param
    params.require(:schedule).permit!
  end

  def get_schedules
    @schedules = Schedule.where(people_id: session[:people_id])
  end

  def manager_get_projects
    @projects = Project.where(manager_id: session[:people_id])
  end

  def get_schedule_by_params
    id = params[:id]
    @schedule = Schedule.find id
  end
end
