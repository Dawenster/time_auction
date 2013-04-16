class AuctionEndWorker
  include Sidekiq::Worker

  def perform(bid_ids)
    bids = Bid.where :id => bid_ids
    auction = bids.first.auction
    highest_bid = auction.highest_bid # they all belong to the same auction
    winner = highest_bid.user
    bids.each do |bid|
      AuctionEndMailer.auction_winner(bid.user, auction, highest_bid).deliver and next if bid == highest_bid
      AuctionEndMailer.auction_loser(bid.user, winner, auction, highest_bid).deliver
    end
  end
end
