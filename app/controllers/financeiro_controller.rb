class FinanceiroController < ApplicationController
  require_logged_user
  require_role_for_pagamento

  def index
    @release = Release.all
  end

  def novo_pagamento
  	@release  = Release.new
  	@release.instalments.build
  	
  	@status     = Status::FINANCIAL
  	@payments   = Payment::OPTIONS
  	@categories = Category::OPTIONS
  end

end
