ActionMailer::Base.smtp_settings = {
  :address   => "smtp.sendgrid.net",
  :port      => 25,
  :domain    => "timeauction.org",
  :user_name => "team@timeauction.org",
  :password  => ENV['ZOHO_PASSWORD'],
  :authentication => :login,
  :enable_starttls_auto => true 
}
