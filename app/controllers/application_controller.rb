class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def ensure_logged_in
      unless current_user
        flash[:alert] = "Please log in first"
        redirect_to new_session_path
      end
    end

    def current_user
      # the OR ||= makes sure this is only run once so as to minimize database queries
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    # Helper method --> makes it available everywhere
    helper_method :current_user





end
