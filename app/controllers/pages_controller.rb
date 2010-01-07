class PagesController < ApplicationController
  
  def appointments
    @categories = Category.all
    ser = Service.all # 19
      @services = ser.in_groups_of(6) 
    sty = Stylist.all
      @stylists =  sty.in_groups_of(3) 
  end
  
  def create
      if  params['commit'] == "contact us"
        @mailer = params
        ContactMailer.deliver_contact_form(@mailer)
      else
        @app_req = params
        AppointmentMailer.deliver_request_for_appointment(@app_req)
      end
      flash[:notice] = "Sent"
      redirect_to :thank_you
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      if params[:manager]
        page_origin = manager_path
      else
        page_origin = @page.title.to_sym
      end
        redirect_to page_origin
    else
      flash[:error] = "Could not save changes please try again."
      render @page.title.to_sym
    end
  end
   
  def pages_manager
    @pages = Page.all(:order => 'updated_at DESC')
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.background_picture = nil
    @page.save
    flash[:notice] = "Default background picture was restored"
    redirect_to manager_path
  end
  
end
