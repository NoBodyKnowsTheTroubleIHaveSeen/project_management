class WelcomeController < ApplicationController
  def index
    if session[:username]
      @username = session[:username]
    else
      redirect_to :action => 'index', controller: 'login'
    end
  end

  def logout
    #session[:username] = nil
    session.clear
    redirect_to :action => 'index', controller: 'login'
  end
end
