class FinanceiroController < ApplicationController
  require_logged_user
  require_role_for_pagamento

  layout false, :only => [:create_instalments]

  def index
    @list_instalments = InstalmentsFilter.filter(params['filtro'])
    @instalment = InstalmentPresenter.new(@list_instalments)
    # Exibe as 4 parcelas mais proximas de vencer
    @instalments_recents = Instalment.pending.order("expiration_date").limit(4)

    @status     = Status::FINANCIAL
    @payments   = Payment::OPTIONS
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

  def pagar
    @instalment = Instalment.find(params[:id])

    @payments   = Payment::OPTIONS
  end

  def pagar_parcela
    @instalment = Instalment.find(params[:pay_instalment][:id])

    # Se a forma de pagamento foi :cheque ou :cheque-pre
    # deixa com status de :recebido
    # caso contrario o status fica como :quitado
    if [1,2].include? params[:pay_instalment][:payment_id].to_i
      params[:pay_instalment][:status_id] = 3
    else
      params[:pay_instalment][:status_id] = 1
    end
    @instalment.update_attributes(params[:pay_instalment])

    redirect_to financeiro_index_path
  end

  def editar_lancamento
    @release = Release.find(params[:id])
    @instalments = @release.instalments

    @status     = Status::FINANCIAL
    @payments   = Payment::OPTIONS
    @categories = Category::OPTIONS
  end

  def update_lancamento
    @release = Release.find(params[:release][:id])
    @release.update_attributes(params[:release])

    redirect_to financeiro_index_path
  end

  def consultar
  end

  def relatorio
  end

  def create_instalments
    @release           = Release.new
    @release.instalments.build
    @number_instalment = params[:number_instalment].to_i
    @total             = params[:total].to_f
    @amount_instalment = (@total/@number_instalment).round(2)
    @last_instalment   = (@total - (@amount_instalment * (@number_instalment -1))).round(2)

    @status     = Status::FINANCIAL
    @payments   = Payment::OPTIONS
  end

end
