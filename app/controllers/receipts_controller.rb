class ReceiptsController < ApplicationController
  require_logged_user
  require_role_for_receipt

  helper_method :status
  helper_method :payments
  helper_method :categories

  layout false, :only => [:search,:create_instalments]

  def index
    # Exibe as 4 parcelas mais proximas de vencer
    @instalments_recents = Instalment.receipts.pending.order("expiration_date").limit(4)
  end

  def new
    @release = Release.new
    @release.instalments.build

    # release_code tera o formato:
    # P120927205100
    # [P|R] + ano + mes + dia + hora + min + seg
    @release_code = 'Decidir como implementar' # "P#{Time.now.strftime('%y%m%d%H%M%S')}"
  end

  def pay
    @instalment = Instalment.find(params[:id])
  end

  def pay_instalment
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

  def edit
    @release = Release.find(params[:id])
    @instalments = @release.instalments
  end

  def update
    @release = Release.find(params[:payment][:id])
    @release.update_attributes(params[:release])

    redirect_to financeiro_index_path
  end

  # Criar Parcelas via Ajax
  def create
    @release           = Release.new
    @release.instalments.build
    @number_instalment = params[:number_instalment].to_i
    @total             = params[:total].to_f
    @amount_instalment = (@total/@number_instalment).round(2)
    @last_instalment   = (@total - (@amount_instalment * (@number_instalment -1))).round(2)
  end

  def search
    @list_instalments = InstalmentsFilter.filter_receipts(params['filtro'])
    @instalment       = InstalmentPresenter.new(@list_instalments)
  end

  private
  def status
    @status     ||= Status::FINANCIAL
  end

  def payments
    @payments   ||= PaymentWay::OPTIONS
  end

  def categories
    @categories ||= Category::OPTIONS
  end
end
