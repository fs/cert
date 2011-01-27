Factory.sequence :skill_type_name do |n|
  "Skill type ##{n}"
end

Factory.define :skill_type do |f|
  f.name { Factory.next(:skill_type_name) }
  f.comment "Skill type comment"
end
