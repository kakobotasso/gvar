class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :code
      t.string :name
      t.integer :category_id
      t.decimal :total_price
      t.integer :number_instalments
      t.boolean :first_paid
      t.boolean :fixed_payment
      t.text :description

      t.timestamps
    end
  end
end
