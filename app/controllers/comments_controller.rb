class CommentsController < ApplicationController
  before_action :logged_author, only: :delete_comments

  def add_comment
    comment = Comment.create(comment_params)
    comment.send("#{params['page_type'].downcase}_id=", params['page_id'])
    comment.save
    redirect_from_params
  end

  def delete_comment
    comment = Comment.find(params['comment_id'])
    comment.destroy
    redirect_from_params
  end

  private

  def comment_params
    params.require('comment').permit('content', 'author_id')
  end

  def logged_author
    comment = Comment.find(params['comment_id'])
    edirect_from_params unless current_user == comment.author || is_admin?
  end

  def redirect_from_params
    case params['page_type']
    when "Project"
      redirect_to project_path(params['page_id'])
    when "User"
      redirect_to user_path(params['page_id'])
    when "Event"
      redirect_to event_path(params['page_id'])
    when "Group"
      redirect_to group_path(params['page_id'])
    end
  end
end
