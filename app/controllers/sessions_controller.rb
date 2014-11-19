class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:email])
    # If user exists and authenticated with correct password, then sign in and redirect to home page
    if user && user.authenticate(params[:password])
      # telling the browser to create a cookie with the authenticated user ID
      # using the session hash
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Logged in!"
    else
      flash[:alert] = "Could not log you in, try again"
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out!"
  end
end
