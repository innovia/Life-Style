class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end
  
  def new
    @picture = Picture.new
  end
  
  
  def create
    @picture = Picture.new(params[:picture])
    
    respond_to do |wants|
      if @picture.save
        flash[:notice] = 'Picture was successfully created.'
        wants.html { redirect_to(@picture) }
        wants.xml { render :xml => @picture, :status => :created, :location => @picture }
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def show
    @picture = Picture.find(params[:id])
  end
  
  
  def delete
    @pictures = Picture.all
    @pictures.all.destroy
  end
end
