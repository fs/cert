Factory.define :certification do |f|
  f.association :user
  f.association :position
  f.finished_at nil
end

Factory.define :finished_certification, :parent => :certification do |f|
  f.finished_at Time.now
  f.result 'OK'
end
