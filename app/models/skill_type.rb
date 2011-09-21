class SkillType < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :skills

  scope :by_certification, lambda {|certification| includes(:skills).where('skills.position_id' => certification.position.id) }
  
  def to_s
    name
  end
  
  def comment_to_html
    RDiscount.new(comment).to_html
  end
end
