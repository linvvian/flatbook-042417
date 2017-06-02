class UsersController < ApplicationController
  before_action :logged_in, except: [:new, :create]
  before_action :timeout_session, except: [:new, :create]
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
    @user = User.new(user_params(:name, :email, :password, :password_confirmation, :cohort_id))
    if @user.save
      session[:user_id] = @user.id
      session[:expires_at] = Time.current + 6.hours
      redirect_to user_path(@user)
    else
      flash[:danger] = "Invalid Input"
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.remove_self
    User.delete(@user)
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params(:name, :email, :password, :password_confirmation, :github, :admin))
      if params[:image].blank? == false
        @user.update(image: params[:image])
      end
      redirect_to @user
    else
      flash.now[:warning] = "Invalid"
      render :edit
    end
  end

  private
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
