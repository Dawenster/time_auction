class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
    @categories = Category.all
  end

  def create
    params[:auction][:end_date] = [params[:auction]["end_date(1i)"],"-", params[:auction]["end_date(2i)"],"-", params[:auction]["end_date(3i)"]].join.to_datetime
    puts "^" * 100
    puts params[:auction][:end_date]
    puts "&" * 100
    @auction = Auction.new
    @auction.title = params[:auction][:title]
    @auction.description = params[:auction][:description]
    @auction.category_id = params[:auction][:category_id]
    @auction.end_date = params[:auction][:end_date]

    Auction.create(title: "Asdfasdf", description: "Asdfasdfasdfdsf", category_id: 1, end_date: "2013-05-10".to_datetime)

    if @auction.save
      redirect_to auction_path @auction
    else
      redirect_to new_auction_path
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
