Then /^I should see all existing skills for "([^"]*)"$/ do |position|
  position = model! %Q{position: "#{position}"}
  skills = position.skills
  
  skills.each do |skill|
    Then %Q{I should see "#{skill.description}" within "div#position_#{position.id}"}
  end
end