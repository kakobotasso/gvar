class CursosController < ApplicationController
  require_logged_user
  require_role_for_curso
  def index
  end
end
