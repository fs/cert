class CertificationsHaveAndBelongToManyExperts < ActiveRecord::Migration
  def self.up
    create_table :certifications_experts, :id => false do |t|
      t.references :certification, :user
    end
  end

  def self.down
    drop_table :certifications_experts
  end
end
