class ThumbsController < CommentsController
  before_action :logged_author, only: :delete_comments

  def like_comment
    comment = find_comment
    if comment.thumb_up_users.include?(current_user)
      thumb = Thumb.find_by(user_id: current_user.id, comment_id: comment.id, like: true)
      thumb.destroy
    else
      Thumb.create(user: current_user, comment: comment, like: true)
    end
    redirect_from_params
  end

  def dislike_comment
    comment = find_comment
    if comment.thumb_down_users.include?(current_user)
      thumb = Thumb.find_by(user_id: current_user.id, comment_id: comment.id, like: false)
      thumb.destroy
    else
      Thumb.create(user: current_user, comment: comment, like: false)
    end
    redirect_from_params
  end

end
