class RegisterController < ApplicationController
  layout false
  def index
  end

  def register
    username = params[:username]
    password = params[:password]
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
    person.save
  end
end
