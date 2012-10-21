class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :code
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :birth_date
      t.string :occupation
      t.string :sex
      t.string :schooling
      t.integer :relationship_elderly
      t.string :phone
      t.string :cellphone
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.integer :country
      t.string :zipcode
      t.text :notes
      t.boolean :rg_delivered, :default => :false
      t.boolean :cpf_delivered, :default => :false
      t.boolean :photo_delivered, :default => :false
      t.boolean :cv_delivered, :default => :false
      t.boolean :address_delivered, :default => :false

      t.timestamps
    end
  end
end
