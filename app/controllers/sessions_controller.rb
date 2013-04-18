class SessionsController < ApplicationController
  def new
    if current_user
      flash[:success] = "You've already logged in :)"
      redirect_to(current_user)
    end
  end

  def create
    puts params
    puts "^"*200
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      params[:session][:remember_me] == "1" ? persistant_sign_in(@user) : sign_in(@user)
      flash[:success] = "Welcome back, #{@user.name}!"
      redirect_back_or @user
    else
      flash.now[:error] = "Invalid email or password"
      @session_email = params[:session][:email]
      render "new"
    end
  end

  def create_identity
    # adopted from: https://github.com/intridea/omniauth/wiki/Managing-Multiple-Providers
    # and the railscast. More on the gem and returned auth hash here: 
    # https://github.com/mkdynamic/omniauth-facebook#auth-hash
  
    auth = request.env['omniauth.auth']

    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      @identity = Identity.create_with_omniauth(auth)
    else
      @identity.update_with_omniauth(auth)
    end

    if signed_in?
      if @identity.user == current_user
        redirect_back_or root_path, notice: "Facebook login refreshed!"
      else
        # TODO: need to figure out how to merge two user accounts (currently 
        # signed in and the one associated with identity) if user_id isn't nil here
        @identity.user = current_user
        @identity.save!
        redirect_back_or root_path, notice: "Successfully linked your account!"
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        redirect_back_or root_path, notice: "Signed in!"
      else
        if User.find_by_email(@identity.email)
          flash[:notice] = "Logged in and account linked! Glad we could pull you away from facebook :)."
          @identity.user = User.find_by_email(@identity.email)
          @identity.save!
        else
          flash[:notice] = "Account created!"
          @identity.create_user
        end
        self.current_user = @identity.user
        
        redirect_back_or(user_path(current_user))
      end
    end

  end

  def destroy
    sign_out
    redirect_to new_session_path
  end
end
