Given /^user: "([^"]*)" has role: "([^"]*)"$/ do |user, role|
  model!(%Q{user: "#{user}"}).roles << model!(%Q{role: "#{role}"})
end
