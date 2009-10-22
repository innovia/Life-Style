class PicturesController < ApplicationController
  before_filter :require_user, :except => :index

  def index
    @pictures = Picture.paginate(:per_page => 9, :page => params[:page])    
  end
  
  def new
    @picture = Picture.new
  end
  
  def edit
    @picture = Picture.find(params[:id])
  end
  
  def update
    @picture = Picture.find(params[:id])
    @picture.attributes = params[:picture]
    respond_to do |wants|
      if @picture.save
        flash[:notice] = 'Picture was successfully updated.'
        wants.html { redirect_to(@picture) }
      else
        wants.html { render :action => "edit" }
      end
    end
  end
  
  def create
    @picture = Picture.new(params[:picture])
    respond_to do |wants|
      if @picture.save
        flash[:notice] = 'Picture was successfully created.'
        wants.html { redirect_to(@picture) }
      else
        wants.html { render :action => "new" }
      end
    end
  end
  
  
  def show
    @picture = Picture.find(params[:id])
  end
  
  
  def destroy
     @picture = Picture.find(params[:id])
     if @picture.destroy
       flash[:notice] = "product removed"
       redirect_to pictures_url
     else 
       flash[:error] = "Could not remove the product"
       render "index"
     end
   end
end
