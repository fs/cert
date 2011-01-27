require 'spec_helper'

describe Skill do
  it { should belong_to :position }
  it { should belong_to :skill_type }
end
