class LoginController < ApplicationController

  layout false

  def index
  end

  def login
    username = params[:username]
    password = params[:password]
    if username
      user = Person.find_by(name: username)
      if user
        passwordFromDataBase = user.password
        if password==passwordFromDataBase
          session[:username] = username
          id = user.id
          session[:people_id] = id
          redirect_to :action => 'index', controller: 'welcome'
          return
        end
      end
    end
    flash[:notice] = I18n.t("login_fail")
    render 'login/index'
    #redirect_to :action => 'index'
  end
end