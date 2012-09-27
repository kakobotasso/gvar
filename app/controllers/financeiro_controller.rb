class FinanceiroController < ApplicationController
  require_logged_user
  require_role_for_pagamento

  def index
    @release = Release.all
  end

  def novo_pagamento
  	@release  = Release.new
  	@release.instalments.build

        # release_code tera o formato:
        # P120927205100
        # [P|R] + ano + mes + dia + hora + min + seg
        @release_code = "P#{Time.now.strftime('%y%m%d%H%M%S')}"

  	@status     = Status::FINANCIAL
  	@payments   = Payment::OPTIONS
  	@categories = Category::OPTIONS
  end

end
