class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :name
      t.string  :cpf
      t.string  :rg
      t.text    :observations
      t.boolean :active
      t.string  :type

      t.timestamps
    end
  end
end
