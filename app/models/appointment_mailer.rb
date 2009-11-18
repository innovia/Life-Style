class AppointmentMailer < ActionMailer::Base
  default_url_options[:host] = "lifestylesalonnyc.com"  
   
  def request_for_appointment(params)
    @app_req = params
    subject     "Appointment request from #{params[:first_name]} #{params[:last_name]}"
    from        "#{params[:email]}"
    recipients  "appointments@lifestylesalonnyc.com"
    sent_on     Time.now
  end
end
