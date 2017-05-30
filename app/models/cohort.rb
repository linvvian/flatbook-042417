class Cohort < ApplicationRecord
  has_many :users
  has_many :instructors, class_name: "User", foreign_key: "instructor_id"

end
