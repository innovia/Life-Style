ActionController::Routing::Routes.draw do |map|

  map.resource :account, :controller => "users"
  
  map.root :controller => "pages", :action => "index"   

  map.register 'register', :controller => "users", :action => "new"
  map.login 'login', :controller => "user_sessions", :action => "new"  
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'  
  
  map.resources :pages, :users, :pictures, :categories, :services, :stylists, :products, :specials
  map.resource :user_session
  
  map.with_options :controller => 'pages' do |page|
    page.manager  'manager', :action => "pages_manager"
    page.about_us  'about_us',  :action => "about_us"
    page.location 'location',   :action => "location"
    page.keratin 'keratin', :action => "keratin"
    page.appointments 'appointments', :action => "appointments"
    page.contact_us 'contact_us', :action => "contact_us"
  end
  
end
