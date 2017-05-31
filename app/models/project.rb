class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :comments
  validates :name, presence: true
  validates :description, presence: true
  validates :github, presence: true

  def members
    self.users.map do |user|
      user.name
    end.join(", ")
  end
end
