class UsersController < ApplicationController
  before_action :logged_in, except: [:new, :create]

  def new
    @user = User.new
    @cohorts = Cohort.all
  end

  def create
    @user = User.new(user_params(:name, :email, :password, :password_confirmation))
    @user.cohort = Cohort.find(params[:user][:cohort_id])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:warning] = "Invalid"
      render 'users/new'
    end
  end

  def show
    @user = current_user
  end

  def destroy
    User.delete(params[:id])
    redirect_to root_path
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params(:name, :email, :password, :password_confirmation, :github))
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
end
