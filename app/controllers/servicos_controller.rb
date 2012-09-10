class ServicosController < ApplicationController
  require_logged_user
  require_role_for_servico

  def index
  end
end
