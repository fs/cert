class CreateCertificationMarks < ActiveRecord::Migration
  def self.up
    create_table :certification_marks do |t|
      t.integer :certification_id
      t.integer :user_id
      t.integer :skill_id
      t.integer :mark
      t.text :comment

      t.timestamps
    end

    add_index :certification_marks, :user_id
    add_index :certification_marks, :certification_id
    add_index :certification_marks, :skill_id
  end

  def self.down
    drop_table :certification_marks
  end
end
