class Team < ActiveRecord::Base
  attr_accessible :class_length, :code, :course_id, :limit, :name, :note, :season, :workload, :active

  belongs_to :course

  validates_presence_of :name, :course_id, :season, :limit, :class_length, :workload

  def curso
  	Course.find(course_id).name
  end

  def periodo
  	Category::Seasons::OPTIONS.rassoc(season)[0]
  end

  def total_carga_horaria
  	class_length + limit
  end

end
