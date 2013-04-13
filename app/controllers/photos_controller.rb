class PhotosController < ApplicationController
  def create
    # if params[:user_id]
      @imageable = User.find(params[:user_id])
    # elsif params[:auction_id]
      # @imageable = Auction.find(params[:auction_id])
    # else # TODO: Placeholder for inevitable Charity imageable
      # return false
    # end

    p = Photo.new
    p.url = params[:file]

    # if @imageable.class == "Auction" 
    #   @imageable.photos << p
    #   p.imageable_type = "Auction" 
    #   p.save!
    #   redirect_to auction_path(@imageable)
    # else
    #   p.imageable_type = "User"
      @imageable.photo = p
      p.save!
      redirect_to user_path(@imageable)
    end
  end
end
