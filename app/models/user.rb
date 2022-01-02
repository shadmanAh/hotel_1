class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
  
  rolify

  has_many :reserves
  has_many :rooms
  has_many :enrollments
  
  def to_s 
    email 
  end


  extend FriendlyId
  friendly_id :email, use: :slugged

  def username
    self.email.split(/@/).first
  end

  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:costumer)
    else 
      self.add_role(:costumer)
    end
  end

  validate :must_have_a_role, on: :update

  def online?
    updated_at > 2.minutes.ago 
  end
  
  def book_room(room)
    self.reserves.create(room: room)
  end

  private 
  def must_have_a_role 
    unless roles.any?
      errors.add(:roles, "must have at least one role")
    end
  end
end
