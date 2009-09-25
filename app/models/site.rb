class Site < ActiveRecord::Base
  acts_as_mappable :auto_geocode => true
  validates_presence_of :name, :geom
  
end