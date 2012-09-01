class Instalment < ActiveRecord::Base
  attr_accessible :expiration_date, :name, :number, :payment, :amount, :amount_paid, :release_id, :status

  belongs_to :release

end
