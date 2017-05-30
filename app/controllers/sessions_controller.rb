class SessionsController < ApplicationController
  def create
    
  end

  def destory
    session[:user_id] = nil
    redirect_to root_path
  end
end
