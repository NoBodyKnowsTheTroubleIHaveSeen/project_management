class BaseInformationController < ApplicationController
  layout false

  def notice
    #选出公告中的最后10条
    @notices = Notice.order("id desc").first 10
    person = Person.find session[:people_id]
    @has_privilege = person.priviliege == 15
  end

  def add_notice
    title = params[:title]
    content = params[:content]
    notice = Notice.new
    notice.title = title
    notice.content = content
    notice.people_id = session[:people_id]
    notice.date = Time.now
    if notice.valid?
      notice.save
      redirect_to :action => :notice
    else
      render :text => "error"
    end
  end

  def relation
    #获得会话人的编号
    people_id = session[:people_id]
    @my_name = Person.find(people_id).name
    #找到该人所参与的项目
    person_project = PersonProject.where(people_id: people_id)
    @project_name = Array.new
    @project_manager = Array.new
    @people = Array.new
    i = 0
    #该人参与了某些项目
    if !person_project.blank?
     #遍历其参与的项目
      person_project.each do |value|
        #根据项目id找到项目名字，管理人员名字
        project = Project.find value.project_id
        manager = Person.find project.manager_id
        manager_name = manager.name
        @project_name.append project.name
        @project_manager.append manager_name
        #根据项目id找到所有开发人员
        p = PersonProject.where('project_id = ? and role != ?', value.project_id,15)
        if !p.blank?
          @people[i] = Array.new
          p.each do |value|
              tmp = Person.find value.people_id
              @people[i].append tmp.name
          end
        end
        i+=1
      end
    end
  end
end
