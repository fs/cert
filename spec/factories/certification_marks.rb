Factory.define :certification_mark do |f|
  f.association :certification
  f.association :user
  f.association :skill
  f.mark 1
  f.comment 'All good'
end
