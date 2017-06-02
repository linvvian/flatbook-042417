class Comment < ApplicationRecord
  include PublicActivity::Common
  # tracked except: :update, owner: ->(controller, model) { controller && controller.current_user }

  belongs_to :project, optional: true
  belongs_to :event, optional: true
  belongs_to :group, optional: true
  belongs_to :user, optional: true
  has_many :thumbs
  validates :content, presence: true

  def author
    User.find(self.author_id)
  end

  def owner
    if self.project_id
      Project.find(self.project_id)
    elsif self.event_id
      Event.find(self.event_id)
    elsif self.user_id
      User.find(self.user_id)
    elsif self.group_id
      Group.find(self.group_id)
    end
  end

  def time
    self.created_at.to_time.localtime.strftime("%B %e, %Y at %I:%M:%S %p")
  end

  def thumb_up
    self.thumbs.select {|thumb| thumb.like == true}
  end

  def thumb_down
    self.thumbs.select {|thumb| thumb.like == false}
  end

  def thumb_up_users
    thumb_up.map {|thumb| thumb.user}
  end

  def thumb_down_users
    thumb_down.map {|thumb| thumb.user}
  end

  def likes
    thumb_up.count
  end

  def dislikes
    thumb_down.count
  end

end
