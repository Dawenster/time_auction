class BidsController < ApplicationController
  def new
    render partial: 'new'
  end

  def create
    @bid = Bid.new params[:bid]
    @bid.user = current_user
    @last_bid = @bid.auction.bids.last

    if @bid.time == nil
      render text: 'Please enter the number of hours you wish to bid!', status: :unprocessable_entity and return
    end

    if @bid.time < @last_bid.time
      render text: 'Your bid must be higher than the current highest bid!', status: :unprocessable_entity and return
    end

    if @bid.save
      render text: render_to_string(partial: 'bid', locals: { bid: @bid })
    else
      render text: @bid.errors.full_messages.join(','), status: :unprocessable_entity
    end
  end
end
