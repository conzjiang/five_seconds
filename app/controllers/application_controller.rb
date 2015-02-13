class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  private
  def current_session
    return nil if session[:token].nil?
    @session ||= Session.find_by(session_token: session[:token])
  end

  def current_user
    @current_user ||= current_session.try(:user)
  end

  def require_sign_in
    unless signed_in?
      flash[:errors] = ["Please sign in first!"]
      redirect_to new_session_url
    end
  end

  def sign_in!(user)
    session[:token] = user.set_session_token!
  end

  def sign_out!
    current_session.destroy!
    session[:token] = nil
  end

  def signed_in?
    !!current_user
  end
end
