class ProjectsController < ApplicationController
  before_action :logged_in
  before_action :logged_member, only: [:edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @other_students = User.where("id != #{current_user.id}")
  end

  def create
    project = Project.new(project_params(:name, :description, :github, :user_ids => []))
    if project.save
      project.users << current_user
      redirect_to project_path(project)
    else
      redirect_to new_project_path
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
    @other_students = current_user.cohort.users.where("id != #{current_user.id}")
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params(:name, :description, :github, :user_ids => []))
    if project.save
      project.users << current_user
      redirect_to project_path(project)
    else
      redirect_to edit_project_path(project)
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path
  end

  private

  def project_params(*args)
    params.require(:project).permit(*args)
  end

  def project_member
    project = Project.find(params[:id])
    project.users.include?(current_user)
  end

  def logged_member
    redirect_to projects_path unless project_member
  end
end
