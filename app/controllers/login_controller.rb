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
        password_from_database = user.password
        if Digest::MD5.hexdigest(password)==password_from_database
          session[:username] = username
          id = user.id
          session[:people_id] = id
          session[:is_manager] = user.priviliege == 10 ? true : false
          render :text => "success"
          return
        end
      end
    end
    render :text => I18n.t("login_fail")
  end
end