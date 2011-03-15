require 'spec_helper'

describe Certification do
  context 'validate' do
    it { should validate_presence_of :position }
    it { should validate_presence_of :user }

    context 'with finished_at field' do
      subject { Certification.new(:finished_at => Time.now) }
      it { should validate_presence_of :result }
    end
  end


  it { should belong_to :position }
  it { should belong_to :user }

  it { should have_and_belong_to_many :experts }

  it { should have_many :certification_marks }
end
