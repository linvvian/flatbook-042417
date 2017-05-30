class CohortsController < ApplicationController
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
    @cohort = Cohort.find(params[:id])
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find(params[:id])
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
  def cohort_params
    params.require(:cohort).permit(:start_date, :nickname)
  end
end
