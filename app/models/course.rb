# *-* encoding: UTF-8 *-*
class Course < ActiveRecord::Base
  attr_accessible :code, :description, :name, :type
end
