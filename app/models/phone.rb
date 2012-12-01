class Phone < ActiveRecord::Base
  TYPES = [ ["Celular", 0], ["Telefone", 1], ["Fax", 2], ["Comercial", 3] ]
  attr_accessible :number, :person_id, :type_number

  belongs_to :person

  def type_phone
      TYPES.rassoc(type_number)[0]
  end
end
