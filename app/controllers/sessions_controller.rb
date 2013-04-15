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

  def create_identity
    auth = request.env['omniauth.auth']
    puts auth
    puts "^" * 300
    # Find an identity here
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      # If no identity was found, create a brand new one here
      @identity = Identity.create_with_omniauth(auth)
    end

    if signed_in?
      if @identity.user == current_user
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it 
        # is the current user. So the identity is already associated with 
        # this user. So let's display an error message.
        redirect_to root_path, notice: "Already linked that account!"
      else
        # The identity is not associated with the current_user so lets 
        # associate the identity

        # need to figure out how to merge two user accounts (currently 
        # signed in and the one associated with identity) if user_id isn't nil here
        @identity.user = current_user
        @identity.save!
        redirect_to root_path, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        # The identity we found had a user associated with it so let's 
        # just log them in here
        self.current_user = @identity.user
        redirect_back_or root_path, notice: "Signed in!"
      else
        #this might not be necessary
        if User.find_by_email(@identity.email)
          flash[:notice] = "Welcome back! Glad we could pull you away from facebook :)"
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
    # user = User.from_omniauth(env["omniauth.auth"])
    # ^ code prior to the big copy/paste

  end

  def destroy
    reset_session
    redirect_to new_session_path
  end
end
