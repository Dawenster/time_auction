class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper  
  
  protected

  def sign_in(user)
    session[:id] = user.id
  end

  def signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id] 
  end

  def current_user=(user)
    @current_user = user
    session[:id] = user.nil? ? user : user.id
  end

  helper_method :current_user, :signed_in?
end
