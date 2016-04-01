FactoryGirl.define do
  factory :appointment do
    date '06-14-2016'
    start Appointment.parse_datetime('06-14-2016 at 1pm')
    finish Appointment.parse_datetime('06-14-2016 at 2pm')
  end
end
