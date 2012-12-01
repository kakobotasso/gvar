class Activity < ActiveRecord::Base
  attr_accessible :description, :meeting_id, :timetable

  validates_presence_of :meeting_id, :timetable, :description

  belongs_to :meeting
end
