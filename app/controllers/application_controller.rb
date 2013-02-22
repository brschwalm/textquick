class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :is_authenticated?
  helper_method :is_authorized?

  def current_user
    if is_authenticated?
       @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def is_authenticated?
    if session[:user_id]
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

  def validate_admin

    unless current_user.admin?
      redirect_to "/dashboard/not_authorized"
    end
  end

  def is_authorized?(permission = nil)
    if permission == nil
      is_authenticated? && (request.get? || current_user.admin?)
    else
       is_authenticated? #todo: add permissions for different actions
    end

  end

end
