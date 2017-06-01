class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
  belongs_to :cohort
  has_many :comments
  has_and_belongs_to_many :events
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :projects
  has_secure_password
  validates :name, presence: true
  # validate :flatiron_email

  def self.search(search)
    if search
      where("lower(name) LIKE ?", "%#{search}%")
    end
  end

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name']
    )
  end

  # def flatiron_email
  #   unless self.email && email.include?("flatironschool.com")
  #     self.errors.add(:email, "Must sign up with Flatiron School email")
  #   end
  # end

end
