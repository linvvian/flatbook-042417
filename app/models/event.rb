class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :comments
  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  
  def creator
    User.find(self.creator_id)
  end

  def all_members
    self.users + self.creator
  end

end
