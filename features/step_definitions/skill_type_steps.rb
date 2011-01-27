When /^I submit valid skill type information$/ do
  @new_skill_type = Factory.build(:skill_type)

  fill_in 'skill_type_name', :with => @new_skill_type.name
  click_button 'skill_type_submit'
end

When /^I submit invalid skill type information$/ do
  @new_skill_type = Factory.build(:skill_type)

  fill_in 'skill_type_name', :with => ''
  click_button 'skill_type_submit'
end

Then /^I should see all existing skill types$/ do
  SkillType.all.each do |skill_type|
    Then %Q{I should see "#{skill_type.name}"}
  end
end

Then /^new skill type should exists$/ do
  SkillType.exists?(:name => @new_skill_type.name).should_not be_blank
end

Then /^new skill type should not exists$/ do
  SkillType.exists?(:name => @new_skill_type.name).should be_blank
end

Then /^existing skill type should be updated$/ do
  skill_type = SkillType.first
  skill_type.name.should eql(@new_skill_type.name)
end

Then /^existing skill type should not be updated$/ do
  skill_type = SkillType.first
  skill_type.name.should_not eql(@new_skill_type.name)
end
