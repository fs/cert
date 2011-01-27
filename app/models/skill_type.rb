class SkillType < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :skills
end
