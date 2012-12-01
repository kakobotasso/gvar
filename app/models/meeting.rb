class Meeting < ActiveRecord::Base
  attr_accessible :date, :team_id
  belongs_to :team
  has_many :activities
  accepts_nested_attributes_for :activities
  validates_presence_of :date, :team_id
end
