class Schedule < ActiveRecord::Base
  attr_accessible :client_id, :code, :date, :estimated_time, :number_days, :provider_id, :service_id

  validates_presence_of :client_id, :code, :date, :estimated_time, :number_days, :provider_id, :service_id

  belongs_to :client
  belongs_to :provider
  belongs_to :service
end
