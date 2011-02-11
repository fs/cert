Factory.define :certification_mark do |f|
  f.association :certification
  f.association :user
  f.mark 0
end
