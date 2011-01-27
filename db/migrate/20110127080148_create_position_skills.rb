class CreatePositionSkills < ActiveRecord::Migration
  def self.up
    create_table :position_skills do |t|
      t.integer :position_id
      t.integer :skill_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :position_skills
  end
end
