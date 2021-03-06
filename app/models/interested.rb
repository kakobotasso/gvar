class Interested < ActiveRecord::Base
  attr_accessible :email, :interest, :name, :phone, :situation, :interested_contacts_attributes
  has_many :interested_contacts
  accepts_nested_attributes_for :interested_contacts
  validates_presence_of :email, :interest, :name, :phone, :situation

  def real_situation
  	Category::Interested::SITUATION.rassoc(situation)[0]
  end
end
