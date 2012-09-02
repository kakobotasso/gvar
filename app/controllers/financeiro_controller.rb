class FinanceiroController < ApplicationController
  before_filter :require_logged_user && :require_role_for_user

  def index
  end

  def novo_pagamento
  	@release  = Release.new
  	@release.instalments.build
  	
  	@status     = Status::FINANCIAL
  	@payments   = Payment::OPTIONS
  	@categories = Category::OPTIONS
  end

end
