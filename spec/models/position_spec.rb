require 'spec_helper'

describe Position do
  it { should validate_presence_of :name }
  # it { should validate_uniqueness_of :name }

  it { should have_many :position_skills }
end
