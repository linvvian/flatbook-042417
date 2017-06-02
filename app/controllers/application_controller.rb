class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin?, :page, :is_self?, :find_friendship

  def index
    @activities = PublicActivity::Activity.order("created_at DESC")
    @user = User.new
    @cohorts = Cohort.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

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

  def timeout_session
    if session[:expires_at] < Time.current
      session[:user_id] = nil
      session[:expires_at] = nil
      flash[:danger] = "Session Timed Out"
      redirect_to root_path
    end
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

  def find_friendship(user_id, friend_id)
    Friendship.find_by(user_id: user_id, friend_id: friend_id) || Friendship.find_by(user_id: friend_id, friend_id: user_id)
  end

end
