class AppointmentMailer < ActionMailer::Base
  default_url_options[:host] = "lifestylesalonnyc.com"  
   
  def request_for_appointment(params)
    @app_req = params
    subject     "Appointment request from #{params[:full_name]}"
    from        "#{params[:email]}"
    reply_to    "#{params[:email]}"
    recipients  "appointments@lifestylesalonnyc.com"
    sent_on     Time.now
  end
end
