=begin
  TODO 
  clean up the nav bar
  appointments mailer
  location pinpionter
  bug with bkg uploads
  add a copyright
  maybe jut maybe round corners in ie
  optimize for production
=end


# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all
  helper_method :logged_in?, :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation
  before_filter :preload_page
  
  # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
   filter_parameter_logging :password

  def logged_in?
    !current_user.nil?
  end
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
    def preload_page
      if controller_name == "pages"
          unless action_name == "update" or action_name == "edit" or action_name == "destroy"
            @page = Page.find_or_create_by_title(action_name)
          else
            @bkg = "/images/Backgrounds/salon_back_panoramic.jpg"
            return
          end
      else
        @page = Page.find_or_create_by_title(controller_name)        
      end
      
      # Default Backgrounds
      # Default background_picture paperclip attachment is salon back panoramic
    	# Override default background if user uploaded a background picture else revert to default background 
    	# @bkg is the current background
    	
      if @page.background_picture_file_name.nil?
        case @page.title 
      	  when "services" then 	@bkg = "/images/Backgrounds/services_background.jpg"
      		when "products" then 	@bkg = "/images/Backgrounds/products.png"
      	  when "index"    then  @bkg = "/images/Backgrounds/salon_front_panoramic.jpg"
      	  else  @bkg = @page.background_picture(:default)
      	end
      else 
      	@bkg = @page.background_picture.url(:bkg)
      end
    end
end
