class SessionsController < ApplicationController
  skip_before_filter :ensure_logged_in, only: [:new, :create]

  def new
    if logged_in?
      redirect_to entries_path
    end
  end

  def create
    user = User.where(email: session_params[:email]).first
    if user.present? && user.password == session_params[:password]
      session[:user_id] = user.id
      redirect_to entries_path
    else
      redirect_to new_sessions_path, :flash => { :error => "Email und Passwort stimmen nicht überein" }
    end
  end

  def destroy
    session.clear
    redirect_to new_sessions_path
  end

  def session_params
    params.permit(:email, :password)
  end
end
