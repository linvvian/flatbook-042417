class Event < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  has_and_belongs_to_many :users
  has_many :comments
  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true

  def creator
    User.find(self.creator_id)
  end

  def members
    self.users.reject {|user| user == self.creator}
  end

  def pretty_date
    self.date.strftime("%B %e, %Y") if self.date
  end

  def pretty_time
    self.time.strftime("%l:%M %p") if self.time
  end

end
