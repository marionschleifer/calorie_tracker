class ApplicationController < ActionController::Base

  before_action :ensure_logged_in
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def ensure_logged_in
    return if logged_in?
    redirect_to new_sessions_path, notice: "Einloggen!"
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    return unless session[:user_id].present?
    @current_user  ||= User.find(session[:user_id])
  end

end
