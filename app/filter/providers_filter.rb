class ProvidersFilter
  def self.filter(options)
    # Se existir o filtro monta a query
    if options
    scope = Provider.includes(:address).includes(:services).order(:'people.created_at')
    scope = scope.where(:name => options[:name])                         unless options[:name].blank?
    scope = scope.where(:name => options[:name])                         unless options[:name].blank?
    scope = scope.where(:'addresses.country_id' => options[:country_id]) unless options[:country_id].blank?
    scope = scope.where(:'addresses.city' => options[:city])             unless options[:city].blank?
    scope = scope.where(:cpf => options[:cpf])                           unless options[:cpf].blank?
    scope = scope.where(:rg => options[:rg])                             unless options[:rg].blank?
    scope = scope.where(:'services.id' => options[:service_id])          unless options[:service_id].blank?
    scope = scope.where(:active => (options[:active] == "true"))         unless options[:active].blank?
    scope
    else
      [] # Ou então retorna um array vazio para a view dizer que nao encontrou resultados
    end
  end
end
