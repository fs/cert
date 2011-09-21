require 'spec_helper'

describe CertificationMark do
  it { should belong_to :certification }
  it { should belong_to :user }
  it { should belong_to :skill }

  it { should validate_presence_of :certification }
  it { should validate_presence_of :user }
  it { should validate_presence_of :mark }
  it { should validate_presence_of :skill }
  it { should validate_presence_of :comment }

  it 'should have a unique #text' do
    Factory(:certification_mark)
    should validate_uniqueness_of(:mark).scoped_to([:certification_id, :user_id, :skill_id])
  end
end
