require 'spec_helper'

describe PositionSkill do
  it { should belong_to :position }
  it { should belong_to :skill }
end
