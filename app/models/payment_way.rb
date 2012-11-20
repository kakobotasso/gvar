# *-* encoding: UTF-8 *-*
module PaymentWay
  #
  # @payments = Payment::OPTIONS
  #
  # select_tag :payment_id, options_for_select(@payments)
  #
  # ira gerar:
  #
  # <select id="payment_id" name="payment_id"><option value="0">Dinheiro</option>
  #   <option value="1">Cheque</option>
  #   <option value="2">Cheque-pre</option>
  #   <option value="3">Cartão Debito</option>
  #   <option value="4">Cartão Credito</option>
  # </select>
  OPTIONS = [
    ["Dinheiro"       , 0],
    ["Cheque"         , 1],
    ["Cheque-pre"     , 2],
    ["Cartão Debito"  , 3],
    ["Cartão Credito" , 4]
  ]
end
