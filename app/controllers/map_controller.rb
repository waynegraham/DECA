class MapController < ApplicationController
  def index
    @map = MapLayers::Map.new("map") do |map, page|
      # Available layers include
      #GOOGLE_SATELLITE, GOOGLE_HYBRID, GOOGLE_PHYSICAL, VE_ROAD, VE_AERIAL, VE_HYBRID, YAHOO, YAHOO_SATELLITE, YAHOO_HYBRID, 
      # MULTIMAP, OPENSTREETMAP, GEOPOLE_OSM, NASA_GLOBAL_MOSAIC, BLUE_MARBLE_NG, WORLDWIND, WORLDWIND_URBAN, WORLDWIND_BATHY
      
      page << map.add_layer(MapLayers::GOOGLE_PHYSICAL)
      page << map.add_layer(MapLayers::GEOPOLE_OSM)

      page << map.add_control(Control::LayerSwitcher.new)
      page << map.add_control(Control::Permalink.new('permalink'))
      page << map.add_control(Control::MousePosition.new)

      page << map.zoom_to_max_extent()
     
    end
  end

end
