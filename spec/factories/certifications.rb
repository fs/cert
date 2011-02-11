Factory.define :certification do |f|
  f.association :user
  f.association :position
  f.finished_at Time.now
end
