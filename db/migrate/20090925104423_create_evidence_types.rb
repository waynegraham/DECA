class CreateEvidenceTypes < ActiveRecord::Migration
  def self.up
    create_table :evidence_types do |t|
      t.string :evidence_type
      
    end
    
  end

  def self.down
    drop_table :evidence_types
  end
end
