class CommentsController < ApplicationController

  def add_comment
    comment = Comment.create(comment_params)
    case params['comment']['page_type']
    when "Project"
      comment.update(project_id: params['comment']['page_id'])
      redirect_to project_path(params['comment']['page_id'])
    when "User"
      comment.update(user_id: params['comment']['page_id'])
      redirect_to user_path(params['comment']['page_id'])
    when "Event"
      comment.update(event_id: params['comment']['page_id'])
      redirect_to event_path(params['comment']['page_id'])
    when "Group"
      comment.update(project_id: params['comment']['page_id'])
      redirect_to group_path(params['comment']['page_id'])
    end
  end

  def delete_comment
  end

  private

  def comment_params
    params.require('comment').permit('content', 'author_id')
  end
end
