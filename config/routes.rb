ActionController::Routing::Routes.draw do |map|
  map.resources :pictures
  map.resource :account, :controller => "users"
  
  map.root  :controller => "info", :action => "index"   

  map.register 'register', :controller => "users", :action => "new"
  map.login 'login', :controller => "user_sessions", :action => "new"  
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'  
  
  map.resources :users, :categories, :services, :appointments, :stylists, :products
  map.resource :user_session
  
  map.with_options :controller => 'info' do |info|
    info.about_us  'about_us',  :action => "about_us"
    info.specials 'specials',   :action => "specials"
    info.location 'location',   :action => "location"
  end
  
end
