class BidsController < ApplicationController
  def create
    @bid = Bid.new params[:bid]
    @bid.user = current_user
    @auction = @bid.auction
    @bids = @auction.bids

    charity = Charity.find_or_create_by_name(params[:bid][:charity_id].downcase.capitalize)

    @bid.charity = charity

    if @bids == []
      @last_bid_time = 0
    else
      @last_bid_time = @bids.last.time
    end
    
    if @bid.time.nil?
      render text: 'Please enter the number of hours you wish to bid!', status: :unprocessable_entity and return
    end

    if @bid.time <= @last_bid_time
      render text: 'Your bid must be higher than the current highest bid!', status: :unprocessable_entity and return
    end

    if @bid.auction.end_date <= Time.now
      render text: 'Sorry!  This auction has ended.  Try another one?', status: :unprocessable_entity and return
    end

    sleep 2

    if @bid.save
      # EmailWorker.perform_async(@bids.reload.map(&:id).uniq)
      
      render text: render_to_string(partial: 'bid', locals: { bid: @bid })
    else
      render text: @bid.errors.full_messages.join(','), status: :unprocessable_entity
    end
  end
end
