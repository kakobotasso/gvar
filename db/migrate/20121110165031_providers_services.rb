class ProvidersServices < ActiveRecord::Migration
  def up
    create_table :providers_services, :id => false do |t|
      t.integer :provider_id
      t.integer :service_id
    end
  end

  def down
  end
end
