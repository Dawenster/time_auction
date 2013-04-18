# ActionMailer::Base.delivery_method = :smtp # be sure to choose SMTP delivery

ActionMailer::Base.smtp_settings = {
  :address   => "smtp.sendgrid.net",
  :port      => 25,
  :domain    => "timeauction.org",
  :user_name => "app14960163@heroku.com",
  :password  => ENV['SENDGRID_PASSWORD'],
  :authentication => :login,
  :enable_starttls_auto => true 
}
