FactoryGirl.define do
  factory :appointment do
    start Appointment.parse_datetime('06/14/2016 at 1pm')
    finish Appointment.parse_datetime('06/14/2016 at 2pm')
  end
end
