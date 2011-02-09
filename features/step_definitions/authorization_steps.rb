Given /^user: "([^"]*)" has role: "([^"]*)"$/ do |user, role|
  model!(%Q{user: "#{user}"}).roles << model!(%Q{role: "#{role}"})
end

Given /^I have "([^"]*)" role$/ do |role|
  @current_user.roles << Role.find_or_create_by_name(role)
end

Then /^access should be denied via authorization rule$/ do
  Then %Q{I should be on the root page}
  And %Q{I should see "You are not authorized to access this page"}
end