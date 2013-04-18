module SessionsHelper
  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or(default, notice = '')
    if notice == ''
      redirect_to(session[:return_to] || default)
    else
      redirect_to (session[:return_to] || default), notice: notice
    end
    session.delete(:return_to)
  end
end
