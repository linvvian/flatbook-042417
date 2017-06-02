class CommentsController < ApplicationController
  before_action :logged_author, only: :delete_comments

  def create
    comment = Comment.new(comment_params)
    comment.send("#{params[:comment][:page_type].downcase}_id=", params[:comment][:page_id])
    if comment.save
      flash[:success] = "Added comment"
    else
      flash[:warning] = "Something went wrong. Try again."
    end
    redirect_from_params
  end

  def destroy
    find_comment.destroy
    redirect_from_params
  end

  private

  def find_comment
    comment = Comment.find(params[:id])
  end

  def comment_params
    params.require('comment').permit('content', 'author_id')
  end

  def logged_author
    find_comment
    redirect_from_params unless current_user == comment.author || is_admin?
  end

  def redirect_from_params
    case params[:comment][:page_type]
    when "Project"
      redirect_to project_path(params[:comment][:page_id])
    when "User"
      redirect_to user_path(params[:comment][:page_id])
    when "Event"
      redirect_to event_path(params[:comment][:page_id])
    when "Group"
      redirect_to group_path(params[:comment][:page_id])
    end
  end
end
