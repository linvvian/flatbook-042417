class Friendship < ApplicationRecord
  include PublicActivity::Common
  # tracked owner: ->(controller, model) { controller && controller.current_user }

  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end
