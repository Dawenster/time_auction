class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @auctions_categories = Hash.new(Array.new)
    @categories.each do |category|
      @auctions_categories[category.name] = category.auctions
    end
  end

  def show
    @auctions = Category.find(params[:id]).auctions
  end

end

