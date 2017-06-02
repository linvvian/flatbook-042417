class CohortsController < ApplicationController
  before_action :logged_in
  before_action :is_admin?, only: [:new, :create, :destroy]
  before_action :timeout_session
  before_action :find_cohort, only: [:show, :edit, :update, :destroy]

  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      redirect_to cohorts_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @cohort.update(cohort_params)
      redirect_to @cohort
    else
      flash.now[:warning] = "Invalid"
      render :edit
    end
  end

  def destroy
    Cohort.delete(params[:id])
    redirect_to cohorts_path
  end

  private

  def find_cohort
    @cohort = Cohort.find(params[:id])
  end

  def cohort_params
    params.require(:cohort).permit(:start_date, :nickname)
  end
end
