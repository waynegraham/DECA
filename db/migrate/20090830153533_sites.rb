class Sites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.column :name, :string, :null => false
      t.column :geom, :point, :null => true, :srid => 4326, :with_z => true
      t.column :description, :text
      t.column :lat, :decimal, :precision => 15, :scale => 10
      t.column :lon, :decimal, :precision => 15, :scale => 10
      
      t.timestamps
      
    end
  end
  
  #Say "Created Sites table"
  #suppress_messages { add_index :sites, :name }
  #Say "add and index!", true
  
  def self.down
    drop_table :sites
  end
end
