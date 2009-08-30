class Sites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.column :name, :string, :null => false
      t.column :geom, :point, :null => true, :srid => 4326, :with_z => true
      t.column :description, :text
      
      t.timestamps
      
    end
  end
  
  Say "Create Sites table"
  suppress_messages { add_index :sites, :name }
  say "add and index!", true
  

  def self.down
    drop_table :sites
  end
end
