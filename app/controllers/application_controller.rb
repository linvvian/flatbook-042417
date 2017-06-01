class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin?, :page, :is_self?

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

  def is_self?(user)
    user == current_user
  end

  def page
    page_type = params[:controller]
    case page_type
    when "projects"
      Project.find(params[:id])
    when "events"
      Event.find(params[:id])
    when "users"
      User.find(params[:id])
    when "groups"
      Group.find(params[:id])
    end
  end

end
