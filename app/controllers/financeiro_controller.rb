class FinanceiroController < ApplicationController
  before_filter :require_logged_user && :require_role_for_user

  def index
  end
end
