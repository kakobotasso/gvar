class Team < ActiveRecord::Base
  attr_accessible :class_length, :code, :course_id, :limit, :name, :note, :season, :workload, :active

  belongs_to :course

  def curso
  	Course.find(course_id).name
  end

  def periodo
  	Category::Seasons::OPTIONS.rassoc(season)[0]
  end
end
