class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.integer :position_id
      t.integer :skill_type_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
end
