class ThumbsController < ApplicationController
  before_action :logged_author, only: :delete_comments

  def create
    thumb = Thumb.create(thumb_params)
    redirect_from_params
  end

  def destroy
    thumb = Thumb.find(params[:id])
    thumb.destroy
    redirect_from_params
  end

  private

  def thumb_params
    params.require(:thumb).permit(:user_id, :comment_id, :like)
  end

  def redirect_from_params
    case params[:thumb][:page_type]
    when "Project"
      redirect_to project_path(params[:thumb][:page_id])
    when "User"
      redirect_to user_path(params[:thumb][:page_id])
    when "Event"
      redirect_to event_path(params[:thumb][:page_id])
    when "Group"
      redirect_to group_path(params[:thumb][:page_id])
    end
  end

end
