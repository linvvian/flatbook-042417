class Thumb < ApplicationRecord
  include PublicActivity::Common
  # tracked owner: ->(controller, model) { controller && controller.current_user }

  belongs_to :comment
  belongs_to :user
end
