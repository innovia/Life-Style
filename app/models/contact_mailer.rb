class ContactMailer < ActionMailer::Base
  default_url_options[:host] = "lifestylesalonnyc.com"  
   
  def contact_form(params)
    @mailer = params
    recipients  "info@lifestylesalonnyc.com"
    subject     "#{params[:subject]}"
    reply_to    "#{params[:email]}"
    sent_on     Time.now
  end
end
