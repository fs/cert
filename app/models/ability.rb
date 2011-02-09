class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
      can :read, [Position, SkillType]
    end

    # cannot update, destroy self
    cannot [:update, :destroy], User, :id => user.id
  end
end
