class Instalment < ActiveRecord::Base
  attr_accessible :expiration_date, :name, :number, :paid_at, :amount, :amount_paid, :release_id, :status_id, :payment_id
  validates_presence_of :expiration_date

  belongs_to :release

  scope :pending,  where(:status_id => 0)
  scope :payments, joins(:release).where(:'releases.type' => :Payment)
  scope :receipts, joins(:release).where(:'releases.type' => :Receipt)

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

  def amount=(value)
    value = value.gsub('.','')
    value = value.gsub(',','.')

    write_attribute(:amount, value)
  end

  def amount_paid=(value)
    value = value.gsub('.','')
    value = value.gsub(',','.')

    write_attribute(:amount_paid, value)
  end

  def pending?
    self.status_id == 0 # 0 => Pendente
  end
end
