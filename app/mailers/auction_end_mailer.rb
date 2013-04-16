class AuctionEndMailer < ActionMailer::Base
  
  def auction_loser(user, winner, auction, bid)
    @user = user
    @winner = winner
    @auction = auction
    @bid = bid
    @url = url
    mail(:from => "team@timeauction.org", :to => user.email, :subject => "The auction '#{@auction.title}' has ended", :content_type => "text/html")
  end

  def auction_winner(user, auction, bid)
    @user = user
    @auction = auction
    @bid = bid
    @url = url
    mail(:from => "team@timeauction.org", :to => user.email, :subject => "You have won a Time Auction!", :content_type => "text/html")
  end

  def url
    'www.timeauction.org/'
  end
end
