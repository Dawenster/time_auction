class BidMailer < ActionMailer::Base
  
  def new_highest_bid(user, new_winner, auction, bid)
    @user = user
    @new_winner = new_winner
    @auction = auction
    @bid = bid
    @url = url
    mail(:from => "team@timeauction.org", :to => user.email, :subject => "A New Bid on TimeAuction", :content_type => "text/html")
  end

  def highest_bidder(user, auction, bid)
    @user = user
    @auction = auction
    @bid = bid
    @url = url
    mail(:from => "team@timeauction.org", :to => user.email, :subject => "You're the higest bidder!", :content_type => "text/html")
  end

  def url
    'www.timeauction.org/'
  end
end
