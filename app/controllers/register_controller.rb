class RegisterController < ApplicationController
  layout false

  def index
  end

  def register
    username = params[:username]
    if username==""
      flash[:notice] = I18n.t('usernameNil')
      redirect_to :action => 'index'
      return
    end
    password = params[:password]
    repassword = params[:repassword]
    if password != repassword
      flash[:notice] = I18n.t('passwordUnequal')
      render :action => 'index'
      return
    end
    gender = params[:gender]
    no = params[:no]
    departmentId = params[:departmentId]
    email = params[:email]
    person = Person.new
    person.name = username
    person.password = password
    person.gender = gender
    person.no = no
    person.department_id = departmentId
    person.email = email
    if person.valid?
      person.save
      session[:username] = username
      p = Person.find_by_name username
      session[:id] = p.id
      redirect_to :action => 'index', controller: 'welcome'
      return
    else
      redirect_to :action => 'index'
    end
  end
end