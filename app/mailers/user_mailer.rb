class UserMailer < ActionMailer::Base
  
  def welcome_email(user)
    @user = user
    @url = "www.timeauction.org" + categories_path
    mail(:from => "team@timeauction.org", :to => user.email, :subject => "Welcome to Time Auction!!! ")
  end

  def password_reset(user)
    @user = user
    @url = 'http://www.TimeAuction.org' + edit_password_reset_path(@user.password_reset_token)
    mail :from => "team@timeauction.org", :to => user.email, :subject => 'Password Reset'
  end
  
end
