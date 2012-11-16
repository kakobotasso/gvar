class ServicesFilter
  def self.filter(options)
    # Se existir o filtro monta a query
    if options
    scope = Service.order(:created_at)
    scope = scope.where(:name => options[:name])                     unless options[:name].blank?
    scope = scope.where(:number_days => options[:number_days])       unless options[:number_days].blank?
    scope = scope.where(:estimated_time => options[:estimated_time]) unless options[:estimated_time].blank?
    scope = scope.where(:default_value => options[:default_value])   unless options[:default_value].blank?
    scope = scope.where(:inactive => (options[:inactive] != "true")) unless options[:inactive].blank?
    scope
    else
      [] # Ou então retorna um array vazio para a view dizer que nao encontrou resultados
    end
  end
end
