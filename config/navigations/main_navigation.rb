SimpleNavigation::Configuration.run do |navigation|  
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'main'

    primary.with_options(:if => Proc.new { user_signed_in? }) do |signed_in_user|
      signed_in_user.item :dashboard, 'Dashboard', root_path
      signed_in_user.item :positions, 'Positions', positions_path if can? :read, Position
      signed_in_user.item :skill_types, 'Skill types', skill_types_path if can? :read, SkillType
      signed_in_user.item :users, 'Users', users_path if can? :read, User
      signed_in_user.item :certifications, 'Certifications', certifications_path if can? :read, Certification
    end
  end
end