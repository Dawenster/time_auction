class ApplicationController < ActionController::Base
  protect_from_forgery

  def sign_in(user)
    session[:id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  helper_method :current_user
end
