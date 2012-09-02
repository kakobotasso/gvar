class Instalment < ActiveRecord::Base
  attr_accessible :expiration_date, :name, :number, :paid_at, :amount, :amount_paid, :release_id, :status_id, :payment_id

  belongs_to :release

end
