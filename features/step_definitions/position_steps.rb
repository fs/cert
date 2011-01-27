When /^I submit valid position information$/ do
  @new_position = Factory.build(:position)

  fill_in 'position_name', :with => @new_position.name
  click_button 'position_submit'
end

When /^I submit invalid position information$/ do
  @new_position = Factory.build(:position)

  fill_in 'position_name', :with => ''
  click_button 'position_submit'
end

Then /^I should see all existing positions$/ do
  Position.all.each do |position|
    Then %Q{I should see "#{position.name}"}
  end
end

Then /^new position should exists$/ do
  Position.exists?(:name => @new_position.name).should_not be_blank
end

Then /^new position should not exists$/ do
  Position.exists?(:name => @new_position.name).should be_blank
end

Then /^exsisting position should be updated$/ do
  position = Position.first
  position.name.should eql(@new_position.name)
end

Then /^exsisting position should not be updated$/ do
  position = Position.first
  position.name.should_not eql(@new_position.name)
end
