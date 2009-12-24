class ContactMailer < ActionMailer::Base
  default_url_options[:host] = "lifestylesalonnyc.com"  
   
  def contact_form(params)
    @mailer = params
    recipients  "ami.mahloof@gmail.com"
    subject     "#{params[:subject]}"
    reply_to    "test@tester.com"
    sent_on     Time.now
  end
end
