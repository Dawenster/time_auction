class AuctionEndMailer < ActionMailer::Base
  
  def auction_loser(user, winner, auction, highest_bid)
    @user = user
    @winner = winner
    @auction = auction
    @bid = highest_bid
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

  def email_admins(finished_auction, auction_winner)
    @admins = User.where(:admin => true)
    @finished_auction = finished_auction
    @winner = auction_winner
    @admins.each do |admin|
      mail(:from => "team@timeauction.org", :to => admin.email, :subject => "An auction finished", :content_type => "text/html")
    end
  end

  def url
    'www.timeauction.org/'
  end
end
