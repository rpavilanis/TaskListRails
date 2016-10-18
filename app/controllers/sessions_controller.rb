class SessionsController < ApplicationController
  def create
    # gets auth hash from github (because we have logged into github)
    auth_hash = request.env['omniauth.auth']
    # by default login failed - if tried to go to address without going to github first
    flash[:notice] = "Login Failed!"
    return redirect_to root_path unless auth_hash['uid']
    # try to find person in database -  with same user_id and same provider.
    @user = User.find_by(user_id: auth_hash[:uid], provider: 'github')
    if @user.nil?
      # User doesn't match anything in the DB.
      # Attempt to create a new user.
      #If couldn't find user - means they are new to website, and that means that they need to be built from github (method is in model)
      @user = User.build_from_github(auth_hash)
      # assuming unable to save, means could login but not save user
      flash[:notice] = "Unable to Save the User"
      return redirect_to root_path unless @user.save
    end

    # Save the user ID in the session
    # session is a type of cookie that lasts the current browser session
    session[:user_id] = @user.id
    # If they are this far, we know they successfully logged in
    flash[:notice] = "Successfully Logged In!"
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
  end
end
