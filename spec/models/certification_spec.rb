require 'spec_helper'

describe Certification do
  it { should validate_presence_of :position }
  it { should validate_presence_of :user }

  it { should belong_to :position }
  it { should belong_to :user }

  it { should have_and_belong_to_many :experts }
end
