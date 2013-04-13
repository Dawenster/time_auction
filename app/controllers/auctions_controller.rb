class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
    @categories = Category.all
  end

  def create
    params[:auction][:start_date] = DateTime.parse(params[:auction][:start_date].split('/').rotate(-1).join(''))
    params[:auction][:end_date] = DateTime.parse(params[:auction][:end_date].split('/').rotate(-1).join(''))
    @auction = Auction.new params[:auction]

    if @auction.save
      redirect_to auction_path @auction
    else
      redirect_to new_auction_path
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @winner = User.find(@auction.winner_id) if @auction.winner_id
    @winning_time = @auction.bids.last.time if @winner
    store_location
  end

  def edit
    @auction = Auction.find(params[:id])
    @categories = Category.all
  end

  def update
  end

  def destroy
  end

end
