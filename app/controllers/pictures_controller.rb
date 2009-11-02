class PicturesController < ApplicationController
  before_filter :require_user, :except => :index
  
  def manager
    @pictures = Picture.all(:order => "position")  
  end
  
  def sort
    params[:picture].each_with_index do |id, index|
      Picture.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  def delete_selected
      params[:picture].each do |pic|
        Picture.find(pic).destroy
      end
      flash[:notice] = "Requested pictures have been deleted." 
      redirect_to gallery_manager_path
  end
  
  
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
