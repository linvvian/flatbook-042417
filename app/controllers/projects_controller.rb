class ProjectsController < ApplicationController
  def index
    @cohorts = Cohort.all
  end

  def new

  end

  def create
    #code
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
  end

  def destroy
    #code
  end
end
