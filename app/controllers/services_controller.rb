class ServicesController < ApplicationController
  before_filter :require_user, :except => :index
  
  def index
    debugger
   get_categories
   @category = Category.new
  end
  
  def new
    @category = Category.find(params[:category_id])
    @service = @category.services.new()
  end 
  
 
 def create
   @category = Category.find(params[:service][:category_id])
   @service = @category.services.new(params[:service])
   if @service.save
     flash[:notice] = "Successfully created..."
     redirect_to services_url
   else
     flash[:error] = "Could not save, please try again."
     render  :new
   end
 end
 
 def show
   @service = Service.find(params[:id])
 end
 
 def edit
  get_categories
  @category = Category.find(params[:category_id])
  @service = Service.find(params[:id])
 end
 
 def update
  @service = Service.find(params[:id])
  if @service.update_attributes(params[:service])
    flash[:notice] = "Changes were saved"
    redirect_to service_path(@service)
  else
    flash[:notice] = "Changes were not saved"
    render  "edit"
  end
 end 
  
 def destroy
   @service = Service.find(params[:id])
   if @service.destroy
     flash[:notice] = "Service removed"
     redirect_to services_url
   else 
     flash[:error] = "Could not remove the service"
     render "index"
   end
 end
  
  
  private
  def get_categories
    @categories = Category.all
  end
  
  
end