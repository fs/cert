require 'spec_helper'

describe User do
  it { should allow_mass_assignment_of(:full_name) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }

  it { should validate_presence_of :full_name }

  it { should have_and_belong_to_many :roles }
  it { should have_many :certifications }
  it { should have_and_belong_to_many :expert_certifications }

  context 'roles' do
    context 'for new user' do
      subject { User.new }
      it { should have_role :visitor }
      it { should_not have_role :user }
    end

    context 'for any user' do
      subject { Factory(:user) }
      it { should_not have_role :visitor }
      it { should have_role :user }
    end

    context 'for user with CTO role' do
      subject { Factory(:user_cto) }
      it { should have_role :cto }
    end

  end
end
