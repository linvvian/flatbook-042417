class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
  belongs_to :cohort, optional: true
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
      name: auth['info']['name'] || "NA",
      email: auth['info']['email'] || "NA",
      password: hash.to_s,
      github: auth['info']['github']|| "github.com",
      cohort_id: 2,
      image: auth['info']['image']
    )
  end

  def remove_self
    @projects = Project.all
    @projects.each do |project|
      if project.users.empty?
        project.delete
      else
        project.users.delete(self)
      end
    end
    @events = Event.all
    @events.each do |event|
      if event.creator == self
        event.delete
      else
        event.users.delete(self)
      end
    end
    @groups = Group.all
    @groups.each do |group|
      if group.creator == self
        group.delete
      else
        group.users.delete(self)
      end
    end
    Comment.all.where("author_id = #{self.id} OR user_id = #{self.id}").delete_all
  end

  # def flatiron_email
  #   unless self.email && email.include?("flatironschool.com")
  #     self.errors.add(:email, "Must sign up with Flatiron School email")
  #   end
  # end

end
