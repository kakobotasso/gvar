class ServicePresenter
  def initialize(list_services)
    @services = list_services
  end

  def partial
    if @services.size > 0
      {
        :partial => "services/services",
        :locals => { :services => @services }
      }
    else
      {
        :partial => "shared/no_results"
      }
    end
  end
end
