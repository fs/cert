Factory.define :skill do |f|
  f.association :position
  f.association :skill_type
  f.description 'Skill'
end
