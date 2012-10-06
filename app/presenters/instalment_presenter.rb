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
      { :text => "Nenhum resultado encontrado para sua busca." }
    end
  end
end
