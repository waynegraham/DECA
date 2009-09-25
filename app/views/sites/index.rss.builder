xml.instruct! :xml, :version=>"2.0"
xml.rss (:version => "2.0", "xmlns:georss" => "http://www.georss.org/georss") {
  xml.channel {
    xml.title("DECA GeoRSS feed")
    xml.link("http://www.deca.org")
    xml.description("Sites in the Database of Early Chesapeake Architecture")
    xml.language('en-us')
    for site in @sites
      xml.item do
        xml.title(site.name)
        xml.description('')
        xml.author("feedback@deca.org ()")
        xml.pubDate(site.created_at.strftime("%a, %d %b %Y %H:%M:%S %z"))
        xml.link( site.id )
        xml.guid(site.id )
        xml.georss :point do
          xml.text! site.lat.to_s + ' ' + site.lon.to_s
        end
    end
  end
  }
}