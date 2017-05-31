class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :event
  belongs_to :group
  belongs_to :user

def author
  User.find(comment.author_id)
end

end
