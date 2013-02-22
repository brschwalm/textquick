class SessionController < ApplicationController

  def create
    auth = auth_hash
    if User.find_by_uid_and_provider(auth["uid"], auth["provider"])
      user = User.find_by_uid_and_provider(auth["uid"], auth["provider"])
    else
      user = User.create_omni_auth(auth)
    end

    session[:user] = user
    redirect_to dashboard_url, :notice => "Welcome %s" % user.name

  end

  def destroy

    session[:user] = nil
    redirect_to welcome_url, :notice => "Thanks!  Come back soon."

  end

  protected

  def auth_hash
    request.env["omniauth.auth"]
  end
end
