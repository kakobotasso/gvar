class Team < ActiveRecord::Base
  attr_accessible :class_length, :code, :course_id, :limit, :name, :note, :season, :workload, :status, :price

  belongs_to :course
  has_many :meetings
  has_many :registrations
  has_many :students, :through => :registrations

  validates_presence_of :name, :course_id, :season, :limit, :class_length, :workload, :status, :price

  def curso
  	Course.find(course_id).name
  end

  def periodo
  	Category::Seasons::OPTIONS.rassoc(season)[0]
  end

  def total_carga_horaria
    num = workload.split(" ")
    "#{num[0].to_i * class_length} #{num[1]}"
  end

  def correct_status
    Status::TEAMS.rassoc(status)[0]
  end

  def students_registered
    students.size || 0
  end

  def vacancies_available
    limit - students_registered
  end

end
