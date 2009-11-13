class AppointmentMailer < ActionMailer::Base
  
  def request_an_appointment
    recipients  "appointments@lifestylesalonnyc.com"
    from        requester.name
    subject     "Appointment request from #{requester.name}"
    sent_on     Time.now
    body        
  end
end
