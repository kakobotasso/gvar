class InstalmentPresenter
  def initialize(list_instalments)
    @instalments = list_instalments
  end

  def partial
    if @instalments.size > 0
      {
        :partial => "shared/instalments",
        :locals => { :instalments => @instalments }
      }
    else
      {
        :partial => "shared/no_results"
      }
    end
  end
end
