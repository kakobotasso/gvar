class AssessoriaController < ApplicationController
  require_logged_user
  require_role_for_assessoria

  def index
    # require 'pry'; binding.pry
  end
end
