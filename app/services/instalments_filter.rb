class InstalmentsFilter
  def self.filter(options)
    # Se existir o filtro monta a query
    if options
    scope = Instalment.joins(:release).order("expiration_date")
    scope = scope.where(:number => options['number']) unless options['number'].blank?
    scope = scope.where(:'releases.name' => options['name']) unless options['name'].blank?
    scope = scope.where(:'releases.code' => options['code']) unless options['code'].blank?
    scope = scope.where(:'releases.code' => options['code']) unless options['code_simple'].blank?
    scope = scope.where("amount >= :min", {:min => options['amount_minimun']}) unless options['amount_minimun'].blank?
    scope = scope.where("amount <= :max", {:max => options['amount_max']}) unless options['amount_max'].blank?
    # implementar depois o fixed_payment
    # scope = scope.where(:'releases.fixed_payment' => options['fixed_payment']) unless options['fixed_payment'].blank?
    scope = scope.where(:'releases.category_id' => options['category_id']) unless options['category_id'].blank?
    scope
    else
      [] # Ou então retorna um array vazio para a view dizer que nao encontrou resultados
    end
  end
end
