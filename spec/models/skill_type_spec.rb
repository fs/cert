require 'spec_helper'

describe SkillType do
  it { should validate_presence_of :name }

  it 'should validate name uniqueness' do
    Factory(:skill_type)
    should validate_uniqueness_of :name
  end


  it { should have_many :skills }
end
