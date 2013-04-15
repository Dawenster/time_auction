class CommentsController < ApplicationController
  def create
    @comment = Comment.new(:content => params[:comment][:content]) #TODO: WHY CANT I BUILD?
    @comment.auction = Auction.find(params[:auction_id])
    @comment.user = current_user

    if @comment.save
      render 'success'
    else
      render 'error'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render :json => {}
  end
end
