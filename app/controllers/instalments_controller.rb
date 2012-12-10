class InstalmentsController < ApplicationController
  layout false, :only => [:create]

  helper_method :status, :payments, :categories

  def create
    @release           = Release.new
    @release.instalments.build
    @number_instalment = params[:number_instalment].to_i
    @total             = params[:total].to_f
    @amount_instalment = (@total/@number_instalment).round(2)
    @last_instalment   = (@total - (@amount_instalment * (@number_instalment -1))).round(2)
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

    redirect_to path_of_release(@instalment.release), :notice => "Parcela numero #{@instalment.number} do lancamento #{@instalment.release.code}, paga com sucesso!"
  end

  private
  def path_of_release(object)
    eval("#{object.type.to_s.downcase.pluralize}_path")
  end

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
