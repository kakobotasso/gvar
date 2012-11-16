class ProviderPresenter
  def initialize(list_providers)
    @providers = list_providers
  end

  def partial
    if @providers.size > 0
      {
        :partial => "providers/providers",
        :locals => { :providers => @providers }
      }
    else
      {
        :partial => "shared/no_results"
      }
    end
  end
end
