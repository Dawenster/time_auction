class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
    @photo = @auction.photos.build
  end

  def create

    unless params[:auction][:start_date].blank? && params[:auction][:end_date].blank?
      params[:auction][:start_date] = DateTime.parse(params[:auction][:start_date].split('/').rotate(-1).join(''))
      params[:auction][:end_date] = DateTime.parse(params[:auction][:end_date].split('/').rotate(-1).join(''))
    end

    @auction = Auction.new params[:auction]
    proper_date = @auction.start_date < @auction.end_date if @auction.start_date && @auction.end_date

    unless proper_date
      flash.now[:errors] = "Start date must be before end date"
    end

    if @auction.save && proper_date
      redirect_to auction_path @auction
    else
      if flash.now[:errors]
        flash.now[:errors] += ". "
        flash.now[:errors] += @auction.errors.full_messages.join(". ")
      else
        flash.now[:errors] = @auction.errors.full_messages.join(". ")
      end
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @winner = User.find(@auction.winner_id) if @auction.winner_id
    @winning_time = @auction.bids.last.time if @winner
    store_location
    @comments = Comment.where('auction_id = ?', @auction.id)
  end

  def edit
    redirect_to root_path unless current_user.admin
    @auction = Auction.find(params[:id])
    @categories = Category.all
    @photo = @auction.photos.build
  end

  def update
    @auction = Auction.find(params[:id])

    unless params[:auction][:start_date].blank? && params[:auction][:end_date].blank?
      @auction.start_date = DateTime.parse(params[:auction][:start_date].split('/').rotate(-1).join(''))
      @auction.end_date = DateTime.parse(params[:auction][:end_date].split('/').rotate(-1).join(''))
    end

    proper_date = @auction.start_date < @auction.end_date if @auction.start_date && @auction.end_date

    unless proper_date
      flash.now[:errors] = "Start date must be before end date"
    end

    if @auction.update_attributes(params[:auction]) && proper_date
      redirect_to auction_path(@auction)
    else
      @categories = Category.all
      if flash.now[:errors]
        flash.now[:errors] += ". "
        flash.now[:errors] += @auction.errors.full_messages.join(". ")
      else
        flash.now[:errors] = @auction.errors.full_messages.join(". ")
      end
      render 'edit'
    end
  end

  def destroy
    @auction = Auction.find(params[:id])
    flash[:success] = "You have successfully deleted #{@auction.title}"
    Auction.destroy(@auction)
    redirect_to user_path(current_user)
  end
end
