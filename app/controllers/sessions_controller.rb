class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:expires_at] = Time.current + 6.hours
      redirect_to user_path(user)
    elsif auth
      session[:omniauth] = auth.except('extra')
      auth_user = User.sign_in_from_omniauth(auth)
      session[:user_id] = auth_user.id
      redirect_to user_path(auth_user)
    else
      flash[:danger] = "Invalid email/password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    session[:expires_at] = nil
    redirect_to root_path
  end
end
