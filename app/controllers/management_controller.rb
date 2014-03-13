class ManagementController < ApplicationController
  require 'date'
  layout false

  def project_management
    @projects = Project.all
    @people = Person.all
  end

  def add_project
    project = Project.new
    project.name = params[:name]
    project.start_date = params[:start_date]
    project.finish_date = params[:finish_date]
    project.description = params[:description]
    project.manager_id = session[:id]
    array = params[:idList]
    if project.valid?
      project.save
      id = project.id
      array.each do |value|
        person_project = PersonProject.new
        person_project.project_id = id
        person_project.role = 1
        person_project.role_name = 'developer'
        person_project.people_id = value
        person_project.save
      end
      @message = I18n.t("add_success")
      return
    end
    @message = I18n.t("input_error")
  end

  def plan
    @list = Plan.find_all_by_people_id session[:id]
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
    puts '---------------'
    puts date
    if plan.valid?
      plan.save
      @message = I18n.t("add_success")
      return
    end
    @message = I18n.t("input_error")
  end

  def task_distribute
    @projects = Project.all
    @people = Person.all
  end

  def schedule_submit
  end

  def schedule_summary
  end
end
