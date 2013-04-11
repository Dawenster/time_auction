class BidsController < ApplicationController
  
  def new
    render partial: 'new'
  end

  def create
    @bid = Bid.new(params[:bid])
    if @bid.save
      respond_with @bid
    else
    end
  end
end
