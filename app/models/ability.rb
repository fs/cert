class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.has_role? :admin
      can :manage, :all
    end

    if user.has_role? :hr
      can :read, [Position, SkillType]
      can :manage, [Skill, User, Certification, CertificationMark]
    end

    if user.has_role? :user
      can :read, [Position, SkillType, Skill]
      can :read, Certification, :user_id => user.id
      can :manage, CertificationMark, {:certification => {:user_id => user.id, :finished_at => nil}}
    end

    if user.has_role? :expert
      can :read, Certification, {:experts => {:id => user.id}}
      can :manage, CertificationMark, {:certification => {:experts => {:id => user.id}, :finished_at => nil}}
    end

    # cannot update, destroy self
    cannot [:update, :destroy], User, :id => user.id
  end
end
