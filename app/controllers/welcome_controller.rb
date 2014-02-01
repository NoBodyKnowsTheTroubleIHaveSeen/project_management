class WelcomeController < ApplicationController
  def index
    if session[:username]
      @username = session[:username]
    else
      redirect_to :action => 'index', controller: 'login'
    end
  end
end
