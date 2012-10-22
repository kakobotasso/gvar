class Release < ActiveRecord::Base
  attr_accessible :category_id, :code, :description, :first_paid, :fixed_payment, :name, :number_instalments, :total_amount, :instalments_attributes

  has_many :instalments

  accepts_nested_attributes_for :instalments

  def category
    Category::OPTIONS.rassoc(category_id)[0]
  end

  def total_amount=(value)
    value = value.gsub('.','')
    value = value.gsub(',','.')

    write_attribute(:total_amount, value)
  end
end
