## Make sure you have defined path in the support/path.rb for
##    when /the edit position_skill page for existing position_skill/
##      edit_position_skill_path(:id => Skill.first.id)
##
#
#When /^I submit valid position_skill information$/ do
#  @new_position_skill = Factory.build(:position_skill)
#
#  fill_in 'position_skill_position_id', :with => @new_position_skill.position_id
#  click_button 'position_skill_submit'
#end
#
#When /^I submit invalid position_skill information$/ do
#  @new_position_skill = Factory.build(:position_skill)
#
#  fill_in 'position_skill_position_id', :with => ''
#  click_button 'position_skill_submit'
#end
#
#Then /^I should see all existing skills$/ do
#  Skill.all.each do |position_skill|
#    Then %Q{I should see "#{position_skill.position_id}"}
#  end
#end
#
#Then /^new position_skill should exists$/ do
#  Skill.exists?(:position_id => @new_position_skill.position_id).should_not be_blank
#end
#
#Then /^new position_skill should not exists$/ do
#  Skill.exists?(:position_id => @new_position_skill.position_id).should be_blank
#end
#
#Then /^exsisting position_skill should be updated$/ do
#  position_skill = Skill.first
#  position_skill.position_id.should eql(@new_position_skill.position_id)
#end
#
#Then /^exsisting position_skill should not be updated$/ do
#  position_skill = Skill.first
#  position_skill.position_id.should_not eql(@new_position_skill.position_id)
#end
