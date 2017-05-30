class User < ApplicationRecord
  belongs_to :cohort
  has_and_belongs_to_many :events
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :projects
  has_secure_password
end
