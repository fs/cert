When /^I submit valid skill information$/ do
  @new_skill = Factory.build(:skill)

  fill_in 'skill_name', :with => @new_skill.name
  click_button 'skill_submit'
end

When /^I submit invalid skill information$/ do
  @new_skill = Factory.build(:skill)

  fill_in 'skill_name', :with => ''
  click_button 'skill_submit'
end

Then /^I should see all existing skills$/ do
  Skill.all.each do |skill|
    Then %Q{I should see "#{skill.name}"}
  end
end

Then /^new skill should exists$/ do
  Skill.exists?(:name => @new_skill.name).should_not be_blank
end

Then /^new skill should not exists$/ do
  Skill.exists?(:name => @new_skill.name).should be_blank
end

Then /^exsisting skill should be updated$/ do
  skill = Skill.first
  skill.name.should eql(@new_skill.name)
end

Then /^exsisting skill should not be updated$/ do
  skill = Skill.first
  skill.name.should_not eql(@new_skill.name)
end
