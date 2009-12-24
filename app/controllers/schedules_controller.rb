class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  
  def show
    @stylist = Stylist.find(params[:id])
    @schedules = @stylist.schedules
  end
  
  def new
    @schedule = Schedule.new
    @stylists = Stylist.all
  end
  
  def create
    @schedule = Schedule.new(params[:schedule])
    if @schedule.save
      flash[:notice] = "Successfully created schedule."
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
    @stylists = Stylist.all
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(params[:schedule])
      flash[:notice] = "Successfully updated schedule."
      redirect_to :action => "index" 
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "Successfully destroyed schedule."
    redirect_to schedules_url
  end
end
