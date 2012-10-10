class Team < ActiveRecord::Base
  attr_accessible :class_length, :code, :course_id, :limit, :name, :note, :season, :workload, :active
end
