class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper  
  
  protected

  def persistant_sign_in(user)
    cookies.permanent[:auth_token] = user.auth_token
  end

  def sign_in(user)
    cookies[:auth_token] = user.auth_token
  end

  def sign_out
    cookies.delete(:auth_token)
  end

  def signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.where(:auth_token => cookies[:auth_token]).first if cookies[:auth_token]
  end

  def current_user=(user)
    @current_user = user
    cookies[:auth_token] = user.nil? ? nil : user.auth_token
  end

  helper_method :current_user, :signed_in?
end
