class Instalment < ActiveRecord::Base
  attr_accessible :expiration_date, :name, :number, :paid_at, :amount, :amount_paid, :release_id, :status_id, :payment_id
  validates_presence_of :expiration_date

  belongs_to :release

  def status
    Status::FINANCIAL.rassoc(status_id)[0]
  end

  def name
    release.name
  end

  def code
    release.code
  end

  def number_instalment
    "#{number}/#{release.number_instalments}"
  end

  def expiration_date_to_s
    expiration_date.strftime('%d/%m/%Y')
  end

end
