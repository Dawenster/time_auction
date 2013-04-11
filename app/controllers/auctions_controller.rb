class AuctionsController < ActionController::Base
  def new
    @auction = Auction.new
    @categories = Category.all
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
