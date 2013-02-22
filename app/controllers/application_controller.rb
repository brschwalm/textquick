class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :is_authenticated?

  def current_user
    if is_authenticated?
       @current_user = session[:user]
    else
      @current_user = nil
    end
  end

  def is_authenticated?
    if session[:user]
      return true
    else
      return false
    end
  end

  def validate_authenticated


    unless is_authenticated?
      debugger
      redirect_to "/auth/identity"
    end

  end

  def is_authorized?
    is_authenticated? && (request.get? || @current_user.admin?)
  end

end
