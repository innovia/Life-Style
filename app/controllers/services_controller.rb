class ServicesController < ApplicationController
  
  def index
   get_categories
  end
  
  def new
    get_categories
    @service = Service.new
  end 
   # TODO 
  #  if @categories.empty?
  #    @category = Category.new
  #    @category.services.build
  #  end
 
 def create
  @service = Service.new(params[:service])
  
  respond_to do |wants|
    if @service.save
      flash[:notice] = 'Service was successfully created.'
      wants.html { redirect_to(@service) }
    else
      flash[:error] = "Could not add the service, check the form"
      wants.html { render :action => "new" }
    end
  end
 end
 
 def show
   @service = Service.find(params[:id])
 end
 
 def edit
  get_categories
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