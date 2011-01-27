Factory.sequence :position_name do |n|
  "Developer ##{n}"
end

Factory.define :position do |f|
  f.name { Factory.next(:position_name) }
end
