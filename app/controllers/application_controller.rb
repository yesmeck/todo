class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :user_signed_in?, :current_user

  def sign_in_as(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def user_signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= if session[:user_id].present?
                        User.find_by(id: session[:user_id])
                      end
  end
end
