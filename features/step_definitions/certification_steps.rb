Given /^I expert for the certification "([^"]*)"$/ do |certification|
  model!(%Q{certification "#{certification}"}).experts << model!(%Q{user "current_user"})
end