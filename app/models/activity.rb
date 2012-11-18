class Activity < ActiveRecord::Base
  attr_accessible :description, :meeting_id, :timetable
  belongs_to :meeting
end
