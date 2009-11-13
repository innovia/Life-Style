# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_name
    @page == controller_name
    if controller_name == 'pages'
      @page = action_name.gsub("_", " ").capitalize
    end
  end
  
end
