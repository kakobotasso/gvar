class ReportsFilter
  def self.filter(options)
    # Se existir o filtro monta a query
    if options
    scope = Instalment.joins(:release).order(:created_at)
    scope = scope.where("releases.type = ?",options[:type]) unless options[:type].blank?
    scope = scope.where(:status_id => options[:status]) unless options[:status].blank?
    scope = scope.where("amount >= ?",options[:min_value]) unless options[:min_value].blank?
    scope = scope.where("amount <= ?",options[:max_value]) unless options[:max_value].blank?
    scope = scope.where("created_at >= ?",Date.parse(options[:min_date_sale])) unless options[:min_date_sale].blank?
    scope = scope.where("created_at <= ?",Date.parse(options[:max_date_sale])) unless options[:min_date_sale].blank?
    scope = scope.where("created_at <= ?",Date.parse(options[:max_date_sale])) unless options[:min_date_sale].blank?
    scope = scope.where("expiration_date >= ?",Date.parse(options[:min_expiration_date])) unless options[:min_expiration_date].blank?
    scope = scope.where("expiration_date <= ?",Date.parse(options[:max_expiration_date])) unless options[:max_expiration_date].blank?
    scope = scope.where("paid_at >= ?",Date.parse(options[:min_payment_date])) unless options[:min_payment_date].blank?
    scope = scope.where("paid_at <= ?",Date.parse(options[:max_payment_date])) unless options[:max_payment_date].blank?
    scope = scope.where("amount_paid >= ?", options[:min_payment_value]) unless options[:min_payment_value].blank?
    scope = scope.where("amount_paid <= ?", options[:max_payment_value]) unless options[:max_payment_value].blank?

    scope
    else
      [] # Ou então retorna um array vazio para a view dizer que nao encontrou resultados
    end
  end
end
