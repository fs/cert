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

  def has_role?(role_sym)
    return true if role_sym == :user && !new_record?
    return true if role_sym == :visitor && new_record?

    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
end
