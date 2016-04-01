class Appointment < ActiveRecord::Base

  def self.parse_datetime str
    Chronic.parse str
  end

end
