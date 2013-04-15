class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @auctions_categories = Hash.new(Array.new)
    @categories.each do |category|
      @auctions_categories[category.name] = category.auctions
    end
  end
end

