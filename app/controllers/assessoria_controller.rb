class AssessoriaController < ApplicationController
  before_filter :require_logged_user && :require_role_for_user

  def index
    # require 'pry'; binding.pry
  end
end
