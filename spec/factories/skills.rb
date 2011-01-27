Factory.sequence :skill_name do |n|
  "Skill ##{n}"
end

Factory.define :skill do |f|
  f.name { Factory.next(:skill_name) }
  f.comment "Skill comment"
end
