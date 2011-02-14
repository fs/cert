class Certification < ActiveRecord::Base
  validates :user, :position, :presence => true

  belongs_to :user
  belongs_to :position

  has_and_belongs_to_many :experts,
      :class_name => 'User',
      :join_table => 'certifications_experts'

  has_many :skill_types

  has_many :certification_marks

  def to_s
    "#{user.full_name}@#{position.name}"
  end
end
