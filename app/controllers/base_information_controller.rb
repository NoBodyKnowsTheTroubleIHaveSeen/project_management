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
      render :text => "caca"
    end
  end

  def relation
  end
end
