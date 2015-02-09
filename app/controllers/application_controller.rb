class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  private
  def current_user
    @current_user ||= Session.find_by(session_token: session[:token]).user
  end

  def sign_in!(user)
    session[:token] = user.set_session_token!
  end

  def signed_in?
    !!current_user
  end
end
