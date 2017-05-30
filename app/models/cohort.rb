class Cohort < ApplicationRecord
  has_many :students
  has_many :instructor_cohorts
  has_many :instructors, through: :instructor_cohorts
end
