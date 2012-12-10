# *-* encoding: UTF-8 *-*
class Course < ActiveRecord::Base
  attr_accessible :code, :description, :name, :course_type, :active

  validates_presence_of :name, :description, :course_type

  has_many :teams

  def categoria
    Category::Courses::OPTIONS.rassoc(course_type)[0]
  end

  def periodo
    Category::Seasons::OPTIONS.rassoc(season)[0]
  end

  def turma_andamento
    if teams.where('status = 0').count > 0
      "Sim"
    else
      "Nao"
    end
  end

  def teams_total
    teams.size || 0
  end
  def teams_in_progress
    teams.where(:status => 0).size || 0
  end
  def teams_completed
    teams.where(:status => 1).size || 0
  end
  def teams_canceled
    teams.where(:status => 2).size || 0
  end
end
