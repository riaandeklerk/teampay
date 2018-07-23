class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :administrator, :check_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def administrator
    @administrator ||= admin_users.include?(current_user.email)
  end

  def admin_users
    @admin_users ||= ENV.fetch('TEAMPAY_ADMINS').split(',').map(&:strip)
  end

  def check_user
    redirect_to root_url, alert: 'Please sign in' unless current_user
  end
end
