# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090925210405) do

  create_table "buildings", :force => true do |t|
    t.column "building_type", :string
    t.column "evidence_type_id", :integer
    t.column "notes", :text
    t.column "created_at", :timestamp
    t.column "updated_at", :timestamp
  end

  create_table "evidence_types", :force => true do |t|
    t.column "evidence_type", :string
  end

  create_table "sites", :force => true do |t|
    t.column "name", :string, :null => false
    t.column "description", :text
    t.column "lat", :decimal, :precision => 15, :scale => 10
    t.column "lon", :decimal, :precision => 15, :scale => 10
    t.column "created_at", :timestamp
    t.column "updated_at", :timestamp
    t.column "site_id", :string, :limit => 12
    t.column "geom", :point, :srid => 4326, :with_z => true
  end

  add_index "sites", ["geom"], :name => "index_sites_on_geom", :spatial=> true 
  add_index "sites", ["name"], :name => "index_sites_on_name"

  create_table "typus_users", :force => true do |t|
    t.column "first_name", :string, :default => "", :null => false
    t.column "last_name", :string, :default => "", :null => false
    t.column "role", :string, :null => false
    t.column "email", :string, :null => false
    t.column "status", :boolean, :default => false
    t.column "token", :string, :null => false
    t.column "salt", :string, :null => false
    t.column "crypted_password", :string, :null => false
    t.column "preferences", :string
    t.column "created_at", :timestamp
    t.column "updated_at", :timestamp
  end

end
