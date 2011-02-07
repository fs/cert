class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  include User::OmniAuthExtension

  has_and_belongs_to_many :roles

  attr_accessible :full_name, :email, :password, :password_confirmation
  validates :full_name, :presence => true

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end
end
