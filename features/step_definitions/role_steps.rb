Given /^user: "([^"]*)" has role: "([^"]*)"$/ do |user, role|
  model!(%Q{user: "#{user}"}).roles << model!(%Q{role: "#{role}"})
end

Given /^I have "([^"]*)" role$/ do |role|
  @current_user.roles << Role.find_or_create_by_name(role)
end
