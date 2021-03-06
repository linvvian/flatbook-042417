class Group < ApplicationRecord
  include PublicActivity::Common
  # tracked owner: ->(controller, model) { controller && controller.current_user }

  has_and_belongs_to_many :users
  has_many :comments
  validates :name, presence: true
  validates :description, presence: true

  def creator
    User.find(self.creator_id)
  end

  def members
    self.users.reject {|user| user == self.creator}
  end
end
