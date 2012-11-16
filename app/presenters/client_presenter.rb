class ClientPresenter
  def initialize(list_clients)
    @clients = list_clients
  end

  def partial
    if @clients.size > 0
      {
        :partial => "clients/clients",
        :locals => { :clients => @clients }
      }
    else
      {
        :partial => "shared/no_results"
      }
    end
  end
end
