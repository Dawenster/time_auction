module SessionsHelper
  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or(default, notice = '')
    redirect_to (session[:return_to] || default), notice: notice
    session.delete(:return_to)
  end
end
