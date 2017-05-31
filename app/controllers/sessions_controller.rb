class SessionsController < ApplicationController
  def create
    if params[:email].blank? || params[:password].blank?
      flash[:warning] = "Needs email/password"
      redirect_to root_path
    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:warning] = "Invalid email/password"
        redirect_to root_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
