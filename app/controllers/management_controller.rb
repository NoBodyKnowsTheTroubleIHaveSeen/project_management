class ManagementController < ApplicationController
  require 'date'
  layout false

  def project_management
    @projects = Project.all
  end

  def goto_add_project
    @people = Person.all
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
    project.delete
    @people = Person.all
    @projects = Project.all
    render :project_management
  end

  #获得项目人员
  def get_project_people
    get_peopple_by_project_id
  end

  def plan
    puts session[:id]
    @list = Plan.find_by(people_id: session[:id])
  end


  def add_plan
    plan = Plan.new
    plan.name = params[:name]
    plan.start_date = params[:start_date]
    plan.description = params[:description]
    plan.hard_level = params[:hard_level]
    plan.people_id = session[:id]
    time = Time.now
    date = Date.new(time.year, time.month, time.day)
    plan.create_date = date
    puts params[:name]
    puts params[:start_date]
    puts params[:description]
    puts params[:hard_level]
    puts session[:people_id]
    puts session[:username]
    puts date
    if plan.valid?
      plan.save
      @message = I18n.t("add_success")
      return
    end
    @message = I18n.t("input_error")
  end

  def task_distribute
    @tasks = Task.all
  end

  def goto_add_task
    @projects = Project.all
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
    task.delete
    @tasks = Task.all
    render :task_distribute
  end


  def schedule_submit
  end

  def schedule_summary
  end

  private
  #通过项目id获得项目人员
  def get_peopple_by_project_id
    @project_id = params[:project_id]
    @project = Project.find @project_id
    personProject = PersonProject.where("project_id = ?", @project_id)
    @project_people = Array.new
    personProject.each do |value|
      p = Person.find value.people_id
      @project_people.append p.id
      @project_people.append p.name
    end
  end
end
