class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin?

  def index
    @user = User.new
    @cohorts = Cohort.all
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    redirect_to root_path unless !!current_user
  end

  def is_admin?
    !!current_user.admin
  end

  def logged_admin
    redirect_to root_path unless is_admin?
  end

end
