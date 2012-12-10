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

    redirect_to login_path, :notice => "É necessario estar logado para acessar"
  end


# depois tentar tirar essas duplicacoes
# gerando dinamicamente os metodos
  def self.require_role_for_assessoria
    before_filter :require_role_for_assessoria
  end

  def require_role_for_assessoria
    return if current_user.have_role?(:assessoria)
    return if current_user.have_role?(:admin)

    redirect_to_dashboard
  end

  def self.require_role_for_servico
    before_filter :require_role_for_servico
  end

  def require_role_for_servico
    return if current_user.have_role?(:servico)
    return if current_user.have_role?(:admin)

    redirect_to_dashboard
  end

  def self.require_role_for_payment
    before_filter :require_role_for_payment
  end

  def require_role_for_payment
    return if current_user.have_role?(:pagamento)
    return if current_user.have_role?(:admin)

    redirect_to_dashboard
  end

  def self.require_role_for_receipt
    before_filter :require_role_for_receipt
  end

  def require_role_for_receipt
    return if current_user.have_role?(:recebimento)
    return if current_user.have_role?(:admin)

    redirect_to_dashboard
  end

  def self.require_role_for_curso
    before_filter :require_role_for_curso
  end

  def require_role_for_curso
    return if current_user.have_role?(:curso)
    return if current_user.have_role?(:admin)

    redirect_to_dashboard
  end

  def self.require_role_for_admin(options = {})
    before_filter :require_role_for_admin, options
  end

  def require_role_for_admin
    return if current_user.have_role?(:admin)

    redirect_to_dashboard
  end

  def redirect_to_dashboard
    redirect_to dashboard_path, :notice => t("mensagens.msg0016")
  end

end
