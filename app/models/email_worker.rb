class EmailWorker
  include Sidekiq::Worker

  def perform(bid_ids)
    bids = Bid.where :id => bid_ids
    auction = bids.first.auction
    highest_bid = auction.highest_bid # they all belong to the same auction
    new_winner = highest_bid.user
    bids.each do |bid|
      BidMailer.highest_bidder(bid.user, auction, highest_bid).deliver and next if bid == highest_bid
      BidMailer.new_highest_bid(bid.user, new_winner, auction, highest_bid).deliver
    end    
  end
end
