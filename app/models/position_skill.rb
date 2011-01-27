class PositionSkill < ActiveRecord::Base
  belongs_to :position
  belongs_to :skill
end
