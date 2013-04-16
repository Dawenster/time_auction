class UsersController < ApplicationController
  def new
    if current_user
      flash[:success] = "You've already logged in :)"
      redirect_to(current_user)
    end
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome, #{@user.name}!"
      UserMailer.welcome_email(@user).deliver
      sign_in(@user)
      redirect_back_or(user_path(@user))
    else
      flash.now[:errors] = @user.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @winning_auctions = Auction.where("winner_id = ?", params[:id])
    @hours_verified = 0

    @bids = @user.bids
    @entered_auctions = @bids.map{ |bid| bid.auction }
    @remaining_tasks = []

    if @winning_auctions
      @winning_auctions.each do |auction|
        user_bid = auction.bids.find_by_user_id(@user.id)
        @hours_verified += auction.verified_time
        unless auction.verified_time == auction.bids.find_by_user_id(@user.id).time
          @remaining_tasks << user_bid
        end
      end
    end
  end
  
end
