class Event < ApplicationRecord
  has_and_belongs_to_many :users

  def creator
    User.find(self.creator_id)
  end

  def all_members
    self.users + self.creator
  end
end
