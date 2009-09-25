class AddSiteIdentifierToSites < ActiveRecord::Migration
  def self.up
    change_table :sites do |t|
      t.string :site_id, :limit => 12 
    end
  end

  def self.down
    remove_column :sites, :site_id
  end
end
