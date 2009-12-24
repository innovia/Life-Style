# Email settings
  ActionMailer::Base.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :authentication => :plain,
    :user_name => "info@lifestylesalonnyc.com",
    :password => "life2009"
  }

  raise_delivery_errors = true
