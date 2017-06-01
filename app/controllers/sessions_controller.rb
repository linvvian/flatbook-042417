class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    elsif auth
      session[:omniauth] = auth.except('extra')
      user = User.sign_in_from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:warning] = "Invalid email/password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_path
  end
end
