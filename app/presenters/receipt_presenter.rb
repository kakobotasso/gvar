class ReceiptPresenter
  def initialize(list_receipts)
    @receipts = list_receipts
  end

  def partial
    if @receipts.size > 0
      {
        :partial => "receipts/receipts",
        :locals => { :receipts => @receipts }
      }
    else
      {
        :partial => "shared/no_results"
      }
    end
  end
end
