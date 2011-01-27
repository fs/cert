Factory.define :position_skill do |f|
  f.association :position
  f.association :skill
  f.description 'Skill'
end
