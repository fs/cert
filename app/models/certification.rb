class Certification < ActiveRecord::Base
  validates :user, :position, :presence => true
  validates :result, :presence => { :if => :result_required? }

  belongs_to :user
  belongs_to :position

  has_and_belongs_to_many :experts,
                          :class_name => 'User',
                          :join_table => 'certifications_experts'

  has_many :certification_marks,
           :dependent => :destroy

  default_scope order('created_at DESC')

  def to_s
    "#{user.full_name}@#{position.name}"
  end

  def all_experts
    @all_experts ||= experts.to_a << user
  end

  def finished?
    finished_at.present?
  end

  private

  def result_required?
    finished_at.present?
  end
end
