class ApplicationController < ActionController::Base
  protect_from_forgery

  def sign_in(user)
    cookies[:id] = user.id
  end

  def current_user
    @current_user ||= User.find(cookies[:id]) if cookies[:id]
  end

  helper_method :current_user
end
