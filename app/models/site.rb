class Site < ActiveRecord::Base
  validates_presence_of :name, :geom
  
end