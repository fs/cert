Factory.sequence :role_name do |n|
  "Role ##{n}"
end

Factory.define :role do |f|
  f.name { Factory.next(:role_name) }
end

Factory.define :role_cto, :parent => :role do |f|
  f.name 'CTO'
end
