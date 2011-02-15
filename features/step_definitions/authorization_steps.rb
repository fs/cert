Given /^user: "([^"]*)" has role: "([^"]*)"$/ do |user, role|
  model!(%Q{user: "#{user}"}).roles << Role.find_or_create_by_name(role)
end

Given /^I have "([^"]*)" role$/ do |role|
  model!('I').roles << Role.find_or_create_by_name(role)
end

Then /^access should be denied via authorization rule$/ do
  Then %Q{I should be on the root page}
  And %Q{I should see "You are not authorized to access this page"}
end

Then /^I should not see "([^"]*)" menu item in the main navigation$/ do |menu|
  Then %Q{I should not see "#{menu}" within "#navigation .main li"}
end