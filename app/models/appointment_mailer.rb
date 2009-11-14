class AppointmentMailer < ActionMailer::Base
  default_url_options[:host] = "localhost:8080"  
   
  def request_for_appointment(params)
    @app_req = params
    subject     "Appointment request from #{params[:full_name]}"
    from        "#{params[:email]}"
    reply_to    "#{params[:email]}"
    recipients  "haimnyc@yahoo.com"
    sent_on     Time.now
  end
end
