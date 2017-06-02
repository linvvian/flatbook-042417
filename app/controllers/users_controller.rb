class UsersController < ApplicationController
  before_action :logged_in, except: [:new, :create]
  before_action :timeout_session, except: [:new, :create]
  before_action :find_user, only: [:show, :destroy, :edit, :update]
  helper_method :is_friend?

  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    end
  end

  def new
    @user = User.new
    @cohorts = Cohort.all
  end

  def create
    @cohorts = Cohort.all
    @user = User.new(user_params(:first_name, :last_name, :email, :password, :password_confirmation, :cohort_id))
    @user.image = "https://ssl.gstatic.com/accounts/ui/avatar_2x.png"
    if @user.save
      @user.create_activity :create, owner: current_user
      session[:user_id] = @user.id
      session[:expires_at] = Time.current + 6.hours
      redirect_to user_path(@user)
    else
      flash[:danger] = "Invalid Input"
      redirect_to root_path
    end
  end

  def show
  end

  def destroy
    @user.remove_self
    User.delete(@user)
    redirect_to root_path
  end

  def edit
    @cohorts = Cohort.all
  end

  def update
    if @user.update(user_params(:first_name, :last_name, :email, :password, :password_confirmation, :github, :admin, :cohort_id, :image))
      redirect_to @user
    else
      flash.now[:warning] = "Invalid"
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params(*args)
    params.require(:user).permit(args)
  end

  def is_friend?
    current_user.my_friends.each do |friend|
      return true if friend.id == params[:id].to_i
    end
    return false
  end
end
