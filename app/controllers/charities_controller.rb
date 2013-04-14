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
  end
end