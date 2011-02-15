class CertificationMark < ActiveRecord::Base
  MARKS = {
      :less => 0,
      :normal => 1,
      :higher => 2
  }

  belongs_to :certification
  belongs_to :user
  belongs_to :skill

  validates :certification, :user, :skill, :mark, :presence => true
  validates :mark, :inclusion => MARKS.values
  validates :comment, :presence => { :if => :comment_required? }
  validates :mark, :uniqueness => {:scope => [:certification_id, :user_id, :skill_id]}

  def to_s
    MARKS.invert[mark]
  end

  private

  def comment_required?
    mark != MARKS[:normal]
  end
end
