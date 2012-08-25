class Release < ActiveRecord::Base
  attr_accessible :category_id, :code, :description, :first_paid, :fixed_payment, :name, :number_instalments, :total_price

  has_many :instalments

  accepts_nested_attributes_for :instalments

end
