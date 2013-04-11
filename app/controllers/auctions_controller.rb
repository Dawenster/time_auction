class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
    @categories = Category.all
  end

  def create
    @auction = Auction.new(params[:auction])
    @auction.end_date = DateTime.now + 14 # TODO Hardcoded end date for now
    if @auction.save
      redirect_to auction_path @auction
    else
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
