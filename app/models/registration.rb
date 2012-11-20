class Registration < ActiveRecord::Base
  attr_accessible :student_id, :team_id
  belongs_to :team
  belongs_to :students
end
