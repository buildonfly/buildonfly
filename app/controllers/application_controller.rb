class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

  def require_login
    @user = User.find_by_id(session[:user_id])
    unless @user
      redirect_to login_url
    end
  end
end
