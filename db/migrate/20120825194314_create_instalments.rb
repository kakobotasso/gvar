class CreateInstalments < ActiveRecord::Migration
  def up
    create_table :instalments do |t|
      t.integer  :release_id        # Com qual release esta relacionado
      t.integer  :number            # Numero da parcela. Ex: 1/3
      t.datetime :expiration_date   # Data de Vencimento
      t.datetime :paid_at           # Data de Pagamento
      t.decimal  :amount            # Valor da parcela
      t.decimal  :amount_paid       # Valor pago
      t.integer  :status_id         # Status do pagamento
      t.integer  :payment_id        # Forma de pagamento
      
      t.timestamps
    end
  end

  def down
    drop_table :instalments
  end
end
