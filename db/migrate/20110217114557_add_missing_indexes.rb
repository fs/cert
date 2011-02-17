class AddMissingIndexes < ActiveRecord::Migration
  def self.up
    add_index :skills, :position_id
    add_index :skills, :skill_type_id
    add_index :certifications_experts, [:certification_id, :user_id]
    add_index :certifications_experts, [:user_id, :certification_id]
    add_index :user_identities, :user_id
    add_index :roles_users, [:user_id, :role_id]
    add_index :roles_users, [:role_id, :user_id]
  end

  def self.down
    remove_index :skills, :position_id
    remove_index :skills, :skill_type_id
    remove_index :certifications_experts, :column => [:certification_id, :user_id]
    remove_index :certifications_experts, :column => [:user_id, :certification_id]
    remove_index :user_identities, :user_id
    remove_index :roles_users, :column => [:user_id, :role_id]
    remove_index :roles_users, :column => [:role_id, :user_id]
  end
end
