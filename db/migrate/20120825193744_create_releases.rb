class CreateReleases < ActiveRecord::Migration
  def up
    create_table :releases do |t|
      t.string  :code               # Codigo no formato XYYYYNNNNN
      t.string  :name               # Nome do lancamento
      t.integer :category_id        # Categoria do lancamento
      t.decimal :total_amount       # Total do lancamento
      t.integer :number_instalments # Numero de parcelas
      t.boolean :first_paid         # Primeira paga?
      t.boolean :fixed_payment      # Parcela fixa?
      t.text    :description        # Descricao do lancamento
      t.string  :type               # Payment ou Receipt

      t.timestamps
    end
  end

  def down
    drop_table :releases
  end
end
