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
    if password==''||password.length<=8||password.length>=16
      render :text => I18n.t('password_can_not_be_null')
      return
    end
    rePassword = params[:repassword]
    if password != rePassword
      render :text => I18n.t('passwordUnequal')
      return
    end
    gender = params[:gender]

    no = params[:no]
    begin
      Integer(no)
    rescue
      render :text => I18n.t('no_should_be_a_number')
      return
    end
    departmentId = params[:departmentId]
    begin
      Integer(no)
    rescue
      render :text => I18n.t('department_id_should_be_a_number')
      return
    end
    email = params[:email]
    priviliege = params[:priviliege]
    person = Person.new
    person.name = username
    person.password = password
    person.gender = gender
    person.no = no
    person.department_id = departmentId
    person.email = email
    person.priviliege = priviliege
    if person.valid?
      person.save
      session[:username] = username
      p = Person.find_by_name username
      session[:people_id] = p.id
      session[:is_manager] = p.priviliege == 10 ? true : false
      render :text => 'success'
    else
      render :text => I18n.t('please_check_email')
    end
  end
end