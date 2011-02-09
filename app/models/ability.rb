class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :hr
      can :read, [Position, SkillType]
      can :manage, [Skill]
    elsif user.has_role? :user # should be the last in
      can :read, [Position, SkillType, Skill]
    end

    # cannot update, destroy self
    cannot [:update, :destroy], User, :id => user.id
  end
end
