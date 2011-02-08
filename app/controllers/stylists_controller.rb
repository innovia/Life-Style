class StylistsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
    
  def index
    @stylists = Stylist.paginate(:per_page => 9, :page => params[:page])
  end
  
   def new
     @stylist = Stylist.new
   end 


  def create
   @stylist = Stylist.new(params[:stylist])
   respond_to do |wants|
     if @stylist.save
       flash[:notice] = 'Stylist was successfully created.'
       wants.html { redirect_to(@stylist) }
     else
       flash[:error] = "Could not add the Stylist, check the form"
       wants.html { render :action => "new" }
     end
   end
  end

  def show
    @stylist = Stylist.find(params[:id])
  end

  def edit
   @stylist = Stylist.find(params[:id])
  end

  def update
   @stylist = Stylist.find(params[:id])
   if @stylist.update_attributes(params[:stylist])
     flash[:notice] = "Changes were saved"
     redirect_to stylist_path(@stylist)
   else
     flash[:notice] = "Changes were not saved"
     render  "edit"
   end
  end 

  def destroy
    @stylist = Stylist.find(params[:id])
    @removed = @stylist.full_name
    if @stylist.destroy
      flash[:notice] = "#{@removed} has been removed"
      redirect_to stylists_url
    else 
      flash[:error] = "Could not remove the stylist #{@removed}"
      render "index"
    end
  end 
end