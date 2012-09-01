class Release < ActiveRecord::Base
  attr_accessible :category_id, :code, :description, :first_paid, :fixed_payment, :name, :number_instalments, :total_price, :instalments_attributes

  has_many :instalments

  accepts_nested_attributes_for :instalments

end
