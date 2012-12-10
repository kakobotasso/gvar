class ReportsFilter
  def self.filter(options)
    # Se existir o filtro monta a query
    if options
    scope = Instalment.joins(:release).order(:created_at)
    scope = :min_value
    :max_value
    :min_date_sale
    :max_date_sale
    :min_expiration_date
    :max_expiration_date
    :min_payment_date
    :max_payment_date
    :min_payment_value
    :max_payment_value

    scope = scope.where(:name => options[:name])                         unless options[:name].blank?
    scope = scope.where(:name => options[:name])                         unless options[:name].blank?
    scope = scope.where(:'addresses.country_id' => options[:country_id]) unless options[:country_id].blank?
    scope = scope.where(:'addresses.city' => options[:city])             unless options[:city].blank?
    scope = scope.where(:cpf => options[:cpf])                           unless options[:cpf].blank?
    scope = scope.where(:rg => options[:rg])                             unless options[:rg].blank?
    scope
    else
      [] # Ou então retorna um array vazio para a view dizer que nao encontrou resultados
    end
  end
end
