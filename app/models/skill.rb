class Skill < ActiveRecord::Base
  belongs_to :position
  belongs_to :skill_type
  validates :description, :presence => true

  scope :by_skill_type, lambda {|skill_type| where(:skill_type_id => skill_type.id) }
  scope :by_position, lambda {|position| where(:position_id => position.id) }
end
