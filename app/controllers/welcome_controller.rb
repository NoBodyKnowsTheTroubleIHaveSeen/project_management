class WelcomeController < ApplicationController
  def index
    @username = session[:username]
  end
end
