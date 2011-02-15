class SkillType < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :skills

  scope :by_certification, lambda {|certification| includes(:skills).where('skills.position_id' => certification.position.id) }
end
