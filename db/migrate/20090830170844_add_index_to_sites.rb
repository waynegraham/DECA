class AddIndexToSites < ActiveRecord::Migration
  def self.up
    add_index :sites, :geom, :spatial => true
    add_index :sites, :name
  end

  def self.down
    remove_index :sites, :geom
    remove_index :sties, :name
  end
end
