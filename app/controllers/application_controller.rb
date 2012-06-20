# -*- encoding:utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

  private
  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  def self.require_logged_user(options = {})
    before_filter :require_logged_user, options
  end

  def require_logged_user
    return if logged_in?

    redirect_to login_path #, :alert => "É necessario estar logado para acessar"
  end

end
