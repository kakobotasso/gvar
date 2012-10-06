class FinanceiroController < ApplicationController
  require_logged_user
  require_role_for_pagamento

  def index
    @list_instalments = InstalmentsFilter.filter(params['filtro'])
    @instalment = InstalmentPresenter.new(@list_instalments)

    # Exibe as 4 parcelas mais proximas de vencer
    @instalments_recents = Instalment.order("expiration_date").limit(4)
    @categories = Category::OPTIONS
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

  def consultar
  end

  def relatorio
  end

end
