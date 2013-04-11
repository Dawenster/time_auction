class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @auctions = Category.find(params[:id]).auctions
  end

end

