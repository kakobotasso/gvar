# *-* encoding: UTF-8 *-*
class Course < ActiveRecord::Base
  attr_accessible :code, :description, :name, :course_type, :active

  validates_presence_of :name, :description, :course_type

  has_many :teams

  def categoria
  	Category::Courses::OPTIONS.rassoc(course_type)[0]
  end
end
