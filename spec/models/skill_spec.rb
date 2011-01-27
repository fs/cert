require 'spec_helper'

describe Skill do
  it { should validate_presence_of :name }
  # it { should validate_uniqueness_of :name }

  it { should have_many :position_skills }
end
