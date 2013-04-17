class CategoriesController < ApplicationController

  def index
    @auctions_categories = Auction.order("created_at DESC").includes(:category).all.group_by {|a| a.category.name}
    @categories = Category::ORDERED_LIST
  end
end

