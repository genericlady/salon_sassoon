FactoryGirl.define do
  factory :appointment do
    start Chronic.parse('today at 1pm')
    finish Chronic.parse('today at 2pm')
  end

end
