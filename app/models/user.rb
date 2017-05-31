class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
  belongs_to :cohort
  has_and_belongs_to_many :events
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :projects
  has_secure_password

  def self.search(search)
    if search
      where("lower(name) LIKE ?", "%#{search}%")
    end
  end
  
end
