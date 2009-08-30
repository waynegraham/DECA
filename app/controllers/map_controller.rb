class MapController < ApplicationController
  def index
    @map = MapLayers::Map.new("map") do |map, page|
      page << map.add_layer(MapLayers::GOOGLE)
          page << map.add_layer(MapLayers::YAHOO_HYBRID)

          page << map.add_control(Control::LayerSwitcher.new)
          page << map.add_control(Control::Permalink.new('permalink'))
          page << map.add_control(Control::MousePosition.new)

          page << map.zoom_to_max_extent()
     
    end
  end

end
