class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset 
      redirect_to root_url, notice: 'Email with password reset instructions sent!'
    else
      redirect_to new_password_reset_path, flash: { error: 'No user with that email in our database!'}
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 5.hours.ago
      redirect_to new_password_reset_path, alert: "Password reset expired :("
    elsif params[:user][:password] != params[:user][:password_confirmation]
      redirect_to edit_password_reset_path(params[:id]), flash: { error: "Passwords didn't match!"}
    elsif @user.update_attribute('password', params[:user][:password])
      redirect_to root_url, notice: "Password reset!"
    else
      redirect_to edit_password_reset_path(params[:id])
    end
  end

end
