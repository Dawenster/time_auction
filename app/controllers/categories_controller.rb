class CategoriesController < ApplicationController::Base

  def index
    @categories = Category.all
  end

end
