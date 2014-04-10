class RegisterController < ApplicationController
  layout false

  def index
  end

  def register
    username = params[:username]
    if username==''
      render :text => I18n.t('username_can_not_be_null')
      return
    end
    person = Person.find_by(name: username)
    if !person.blank?
      render :text => I18n.t('username_has_been_register')
      return
    end
    password = params[:password]
    if password==''
      render :text => I18n.t('password_can_be_null')
      return
    end
    rePassword = params[:repassword]
    if password != rePassword
      render :text => I18n.t('passwordUnequal')
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
      session[:people_id] = p.id
      render :text => 'success'
    else
      render :text => I18n.t('please_check_no_department_id_and_email')
      #redirect_to :action => 'index'
    end
  end
end