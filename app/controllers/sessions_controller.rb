class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      flash[:success] = "Welcome back, #{@user.name}!"
      sign_in(@user)
      redirect_back_or @user
    else
      flash.now[:error] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end
end
