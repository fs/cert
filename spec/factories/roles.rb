Factory.sequence :role_name do |n|
  "Role ##{n}"
end

Factory.define :role do |f|
  f.name { Factory.next(:role_name) }
end
