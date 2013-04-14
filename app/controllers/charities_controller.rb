class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
  end

  def new
    @charity = Charity.new
    @photo = @charity.photos.build
  end

  def create
    @charity = Charity.new(params[:charity])

    if @charity.save
      redirect_to charity_path(@charity)
    else
      flash.now[:errors] = @charity.errors.full_messages.join(". ")
      render 'new'
    end
  end

  def show
    @charity = Charity.find(params[:id])
    @volunteers = @charity.bids.map { |bid| bid.user }.uniq
  end

  def edit
    @charity = Charity.find(params[:id])
    @photo = @charity.photos.build
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update_attributes(params[:charity])
      redirect_to charity_path(@charity)
    else
      flash.now[:errors] = @charity.errors.full_messages.join(". ")
      render 'edit'
    end
  end

  def destroy
    @charity = Charity.find(params[:id])
    flash[:success] = "You have successfully deleted #{@charity.name}"
    Charity.destroy(@charity)
    redirect_to user_path(current_user)
  end
end
