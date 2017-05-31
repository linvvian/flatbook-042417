class Cohort < ApplicationRecord
  has_many :users
  has_many :projects, through: :users
  validates :start_date, presence: true

end
