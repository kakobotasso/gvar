class InstalmentPresenter
  def initialize(list_instalments)
    @instalments = list_instalments
  end

  def partial
    if @instalments.size > 0
      {
        :partial => "financeiro/instalments",
        :locals => { :instalments => @instalments }
      }
    else
      {
        :partial => "financeiro/no_results"
      }
    end
  end
end
