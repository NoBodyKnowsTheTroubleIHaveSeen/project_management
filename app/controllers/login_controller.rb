class LoginController < ApplicationController

  layout false

  def index
  end

  def login
    username = params[:username]
    password = params[:password]
    user = Person.find_by(name: username)
    password2 = user.password if user
    if password==password2
      redirect_to :action => 'index',controller: 'welcome'
    else
      redirect_to :action => 'index'
    end

    end
  end