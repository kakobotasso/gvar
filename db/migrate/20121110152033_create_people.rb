class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :name
      t.string  :cpf
      t.string  :rg
      t.text    :observations
      t.boolean :active
      t.string  :type
      t.string :birth_date
      t.string :occupation
      t.integer :sex
      t.string :schooling
      t.integer :relationship_elderly
      t.text :notes
      t.boolean :rg_delivered,      :default      => false
      t.boolean :cpf_delivered,     :default     => false
      t.boolean :photo_delivered,   :default   => false
      t.boolean :cv_delivered,      :default      => false
      t.boolean :address_delivered, :default => false

      t.timestamps
    end
    add_index :people, :name
    add_index :people, :cpf
    add_index :people, :rg
    add_index :people, :type
    add_index :people, :birth_date
    add_index :people, :updated_at
  end
end
