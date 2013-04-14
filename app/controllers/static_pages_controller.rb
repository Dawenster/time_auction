class StaticPagesController < ApplicationController
  def index
    @users = User.all
    render :index, :layout => false
  end

  def about
    @users = User.all
    render :about, :layout => false
  end
end
