class InterestedContact < ActiveRecord::Base
	belongs_to :interested
	attr_accessible :date, :description, :interested_id
	
	validates_presence_of :date, :description, :interested_id

end
