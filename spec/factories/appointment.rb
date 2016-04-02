FactoryGirl.define do
  factory :appointment do
    date '06-14-2016'
    start Chronic.parse('06-14-2016 at 1pm')
    finish Chronic.parse('06-14-2016 at 2pm')
  end
end
