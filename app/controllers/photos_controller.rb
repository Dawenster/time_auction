class PhotosController < ApplicationController
  def create
    @imageable = User.find(params[:user_id])
    p = Photo.new
    p.url = params[:file]
    @imageable.photo = p
    p.save!
    redirect_to user_path(@imageable)
  end
end
