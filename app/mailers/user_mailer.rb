class UserMailer < ActionMailer::Base
  
  def welcome_email(user)
    @user = user
    @url = "www.timeauction.org" + categories_path
    mail(:from => "team@timeauction.org", :to => user.email, :subject => "Welcome to Time Auction!!! ")
  end
  
end
