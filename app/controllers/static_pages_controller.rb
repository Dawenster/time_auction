class StaticPagesController < ApplicationController
  def index
    @users = User.all
    render :index, :layout => false
  end
end
