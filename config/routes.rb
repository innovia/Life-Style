ActionController::Routing::Routes.draw do |map|
  map.resources :pictures
  map.root  :controller => "info", :action => "index"   

  map.resources :categories, :services, :appointments, :stylists, :products
  
  map.with_options :controller => 'info' do |info|
    info.about_us  'about_us',  :action => "about_us"
    info.specials 'specials',   :action => "specials"
    info.location 'location',   :action => "location"
  end
  
end
