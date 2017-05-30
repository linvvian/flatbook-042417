class UsersController < ApplicationController

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
  end

  def destroy
  end

  def edit

  end

  def update

  end

  private
  def user_params(*args)
    params.require(:user).permit(args)
  end
end
