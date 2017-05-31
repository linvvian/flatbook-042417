class Comment < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :event, optional: true
  belongs_to :group, optional: true
  belongs_to :user, optional: true

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

end
