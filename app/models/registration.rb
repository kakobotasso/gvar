class Registration < ActiveRecord::Base
  attr_accessible :student_id, :team_id, :code, :status
  belongs_to :team
  belongs_to :student
  belongs_to :release
end
