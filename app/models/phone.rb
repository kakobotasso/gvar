class Phone < ActiveRecord::Base
  attr_accessible :number, :person_id, :type_number

  belongs_to :person
end
