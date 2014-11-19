module ApplicationHelper



private
  def current_user
    # the OR ||= makes sure this is only run once so as to minimize database queries
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
