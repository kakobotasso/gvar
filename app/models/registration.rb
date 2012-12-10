class Registration < ActiveRecord::Base
  attr_accessible :student_id, :team_id, :code, :status, :release_id
  belongs_to :team
  belongs_to :student
  belongs_to :release

  def status_current
    Category::Courses::STATUS.rassoc(status)[0]
  end
end
