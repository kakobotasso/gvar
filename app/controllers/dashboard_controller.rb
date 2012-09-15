class DashboardController < ApplicationController
  require_logged_user
  layout 'dash'

  def index
  end

end