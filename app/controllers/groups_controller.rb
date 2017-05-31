class GroupsController < ApplicationController
  before_action :find_group, except: [:index, :new, :create]
  helper_method :is_member?, :is_creator?

  def index
    @groups = Group.all.order("created_at DESC")
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.creator_id = current_user.id
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group.delete
    redirect_to groups_path
  end

  private

  def is_member?
    @group.users.include?(current_user)
  end

  def find_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :description, :creator_id)
  end

  def is_creator?
    @group.creator == current_user
  end
end
