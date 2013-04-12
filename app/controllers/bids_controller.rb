class BidsController < ApplicationController
  def new
    render partial: 'new'
  end

  def create
    @bid = Bid.new params[:bid]
    @bid.user = current_user

    if @bid.save
      render text: render_to_string(partial: 'bid', locals: { bid: @bid })
    else
      render text: @bid.errors.full_messages.join(','), status: :unprocessable_entity
    end
  end
end
