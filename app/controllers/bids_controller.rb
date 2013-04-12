class BidsController < ApplicationController
  respond_to 
  def new
    render partial: 'new'
  end

  def create
    @bid = Bid.new params[:bid]
    @bid.user = current_user
    # redirect_to new_session_path unless current_user
    if @bid.save
      render text: render_to_string(partial: 'bid', locals: { bid: @bid })
    else
      render json: { error: @bid.errors.full_messages.join(',') }, status: :unprocessable_entity

    end
  end
end
