class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :building_type
      t.references :evidence_type
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
