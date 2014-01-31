class RegisterController < ApplicationController
  layout false

  def index
  end

  def register
    username = params[:username]
    if !username
      flash[:notice] = I18n.t('usernameNil')
      redirect_to index
      return
    end
    password = params[:password]
    repassword = params[:repassword]
    if password != repassword
      flash[:notice] = I18n.t('passwordUnequal')
      redirect_to index
      return
    end
    gender = params[:gender]
    no = params[:no]
    projectId = params[:projectId]
    departmentId = params[:departmentId]
    email = params[:email]
    person = Person.new
    person.name = username
    person.password = password
    person.gender = gender
    person.no = no
    person.projectId = projectId
    person.departmentId = departmentId
    person.email = email
    person.save if person.valid?
  end
end