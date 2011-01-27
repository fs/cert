class Position < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :position_skills
end
