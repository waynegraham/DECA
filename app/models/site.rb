class Site < ActiveRecord::Base
  #acts_as_mappable :auto_geocode => true
  acts_as_mappable
  validates_presence_of :name
  
end