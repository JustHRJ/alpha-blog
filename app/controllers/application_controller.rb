class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
#by default, these methods are only accessible within the controller and not open to the view. However, by using 'helper_method', it opens up to the view
#normally, application_helper are where methods are open for the view. 
#These helper methods are placed here due to the logic of authentication features grouping
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #return user based on user_id in the sessions 
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in"
      redirect_to root_path
    end
  end
  
end
