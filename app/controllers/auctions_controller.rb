class AuctionsController < ApplicationController
  before_filter :load_auction, :only => [:show, :edit, :update, :destroy, :comments]

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
    @winner = User.find(@auction.winner_id) if @auction.winner_id
    @winning_time = @auction.bids.last.time if @winner
    store_location
    @comments = paginated_comments
    @bids = @auction.bids
    @all_charities = Charity.all.map { |charity| charity.name }
  end

  def edit
    redirect_to root_path unless current_user.admin
  end

  def update
    @auction.parse_dates(params)
    params[:auction].delete(:start_date) && params[:auction].delete(:end_date)

    proper_date = @auction.start_date < @auction.end_date if @auction.start_date && @auction.end_date

    if @auction.winner_id
      auction_winner = User.find(@auction.winner_id) 
      auction_winner.time_donated += (params[:auction][:verified_time].to_i - @auction.verified_time)
      auction_winner.save
    end

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
    flash[:success] = "You have successfully deleted #{@auction.title}"
    Auction.destroy(@auction)
    redirect_to user_path(current_user)
  end

  def comments
    @comments = paginated_comments
    render :partial => 'comments/paginated_comments'
  end

  private
  def load_auction
    @auction = Auction.find(params[:id])
  end

  def paginated_comments
    @auction.comments.paginate(page: params[:page], :per_page => 10)
  end
end
