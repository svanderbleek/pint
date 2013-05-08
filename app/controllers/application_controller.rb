class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user=(user)
    session[:id] = user.id
    @current_user = user
  end

  def current_user
    if id = session[:id]
      @current_user ||= User.find(id)
    end
  end
  helper_method :current_user
end
