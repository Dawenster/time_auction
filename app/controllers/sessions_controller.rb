class SessionsController < ApplicationController
  def new
    if current_user
      flash[:success] = "You've already logged in :)"
      redirect_to(current_user)
    end
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      flash[:success] = "Welcome back, #{@user.name}!"
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
