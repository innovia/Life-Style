class PagesController < ApplicationController
  
  def index
    @bkg = "salon_front_panoramic.jpg"
  end
  
  def about_us
    
  end

  def location
    #require 'rubygems'
    #require 'google_geocode'
    
    #gg = GoogleGeocode.new "ABQIAAAAgNb7wpLp8btvZ6Z3iIuF7RQ6RQOc72mUznGOzXn2f-R8JT8lKRSWZK-ZfvNgdw9WbZ5zSIU-TMV1fA" #hard coded
    #not hardcoded
    #gg = GoogleGeocode.new YAML.load_file(RAILS_ROOT +‘/config/gmaps_api_key.yml’)[ENV['RAILS_ENV']]
    #loc = gg.locate "822 broadway newyork, NY 10003"
    
  #  @map = GMap.new("map_div")
   # @map.control_init(:small => true) #add :large_map => true to get zoom controls
    #@map.center_zoom_init([loc.latitude, loc.longitude],14)
    #@map.overlay_init(GMarker.new([loc.latitude, loc.longitude],:title => "LifeStyle Salon NYC", :info_bubble => loc.address))
  end

  def specails
    
  end

end
