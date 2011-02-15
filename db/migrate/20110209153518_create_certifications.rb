class CreateCertifications < ActiveRecord::Migration
  def self.up
    create_table :certifications do |t|
      t.integer :user_id
      t.integer :position_id
      t.datetime :finished_at

      t.timestamps
    end

    add_index :certifications, :user_id
    add_index :certifications, :position_id
  end

  def self.down
    drop_table :certifications
  end
end
