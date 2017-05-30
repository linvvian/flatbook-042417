class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:warning] = "Invalid user/password"
      render 'application/index'
    end
  end

  def destory
    session[:user_id] = nil
    redirect_to root_path
  end
end
