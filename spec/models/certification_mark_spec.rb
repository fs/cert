require 'spec_helper'

describe CertificationMark do
  it { should belong_to :certification }
  it { should belong_to :user }

  it { should validate_presence_of :certification }
  it { should validate_presence_of :user }
  it { should validate_presence_of :mark }
  
  context 'with mark lower then required' do
    subject { CertificationMark.new(:mark => CertificationMark::MARKS[:lower]) }
    it {s should validate_presence_of :comment }
  end

  context 'with mark higher than required' do
    subject { CertificationMark.new(:mark => CertificationMark::MARKS[:higher]) }
    it {s should validate_presence_of :comment }
  end
end
