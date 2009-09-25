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

ActiveRecord::Schema.define(:version => 20090925111116) do

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
    t.column "geom", :point, :srid => 4326, :with_z => true
    t.column "site_id", :string, :limit => 12
  end

  add_index "sites", ["geom"], :name => "index_sites_on_geom", :spatial=> true 
  add_index "sites", ["name"], :name => "index_sites_on_name"

end
