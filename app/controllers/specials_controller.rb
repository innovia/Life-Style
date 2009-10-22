class SpecialsController < ApplicationController
  before_filter :require_user, :except => :index
  
  def index
    @specials = Special.all
  end

  def show
    @special = Special.find(params[:id])
  end

  def new
    @special = Special.new
  end

  def edit
    @special = Special.find(params[:id])
  end

  def create
    @special = Special.new(params[:special])

    respond_to do |format|
      if @special.save
        flash[:notice] = 'Special was successfully created.'
        format.html { redirect_to(@special) }
      else
        flash[:error] = "there was a problem saving the special."
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @special = Special.find(params[:id])

    respond_to do |format|
      if @special.update_attributes(params[:special])
        flash[:notice] = 'Special was successfully updated.'
        format.html { redirect_to(@special) }
      else
        flash[:error] = "there was a problem saving the special."
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @special = Special.find(params[:id])
    @special.destroy
  end
end
