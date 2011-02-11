class CertificationMark < ActiveRecord::Base
  MARKS = {
      :less => -1,
      :normal => 0,
      :higher => 1
  }

  belongs_to :certification
  belongs_to :user

  validates :certification, :user, :mark, :presence => true
  validates :mark, :inclusion => MARKS.values
  validates :comment, :presence => { :if => :comment_required? }

  private

  def comment_required?
    mark != MARKS[:normal] 
  end
end
