class SitesController < ApplicationController
  # GET /sites
  # GET /sites.xml
  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.rss
      format.xml  { render :xml => @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    @site = Site.find(params[:id])
    
     @map = MapLayers::Map.new("map") do |map, page|
        # Available layers include
        #GOOGLE_SATELLITE, GOOGLE_HYBRID, GOOGLE_PHYSICAL, VE_ROAD, VE_AERIAL, VE_HYBRID, YAHOO, YAHOO_SATELLITE, YAHOO_HYBRID, 
        # MULTIMAP, OPENSTREETMAP, GEOPOLE_OSM, NASA_GLOBAL_MOSAIC, BLUE_MARBLE_NG, WORLDWIND, WORLDWIND_URBAN, WORLDWIND_BATHY

        page << map.add_layer(MapLayers::GOOGLE_PHYSICAL)
        page << map.add_layer(MapLayers::GEOPOLE_OSM)

        page << map.add_control(Control::LayerSwitcher.new)
        page << map.add_control(Control::Permalink.new('permalink'))
        page << map.add_control(Control::MousePosition.new)

        page << map.add_layer(Layer::GeoRSS.new("GeoRSS", "sites/georss"))
        #page << map.add_layer(Layer::GML.new("Sites KML", "/sites/kml", {:format => JsExpr.new("OpenLayers.Format.KML")}))
        page << map.add_layer(Layer::WFS.new("Sites WFS", "/sites/wfs", {:typename => "places"}, {:featureClass => 
          JsExpr.new("OpenLayers.Feature.WFS")}))
        
        page << map.zoom_to_max_extent()

    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        flash[:notice] = 'Site was successfully created.'
        format.html { redirect_to(@site) }
        format.xml  { render :xml => @site, :status => :created, :location => @site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.xml
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        flash[:notice] = 'Site was successfully updated.'
        format.html { redirect_to(@site) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.xml
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to(sites_url) }
      format.xml  { head :ok }
    end
  end
end
