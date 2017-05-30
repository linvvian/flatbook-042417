class InstructorCohort < ApplicationRecord
  belongs_to :cohort
  belongs_to :instructor
end
