class InterestedContact < ActiveRecord::Base
	belongs_to :interested
	attr_accessible :date, :description, :interested_id
	
end
