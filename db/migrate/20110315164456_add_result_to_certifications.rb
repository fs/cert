class AddResultToCertifications < ActiveRecord::Migration
  def self.up
    add_column :certifications, :result, :text
  end

  def self.down
    remove_column :certifications, :result
  end
end
