require 'spec_helper'

describe Role do
  it { should validate_presence_of :name }

  it 'should validate name uniqueness' do
    Factory(:role)
    should validate_uniqueness_of :name
  end
  
  it { should have_and_belong_to_many :users }
end
