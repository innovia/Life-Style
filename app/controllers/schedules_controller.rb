class SchedulesController < ApplicationController
  def index
    respond_to do |wants|
      wants.html {
        if params[:stylist_id] 
          @stylist = Stylist.find(params[:stylist_id])
          @schedules = @stylist.schedules
        else
          @stylists = Stylist.all
          @schedules = Schedule.all
        end
      }
      wants.js { 
          @stylist = Stylist.find(params[:stylist_id])
          @schedules = @stylist.schedules
         }
    end
    
  end
  
  def show
    @stylist = Stylist.find(params[:stylist_id])
    @schedules = @stylist.schedules
  end
  
  def new
    @stylist = Stylist.find(params[:stylist_id])
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
