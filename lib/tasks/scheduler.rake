desc "Check for completed auction"

task :check_auction_finished => :environment do
  Auction.check_auction_finished
end

