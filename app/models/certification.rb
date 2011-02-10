class Certification < ActiveRecord::Base
  validates :user, :position, :presence => true

  belongs_to :user
  belongs_to :position
end
