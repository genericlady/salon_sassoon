describe 'Appointment' do
  # start: 2016-06-14 13:00:00 -0400
  # finish: 2016-06-14 14:00:00 -0400
  let(:appointment) { FactoryGirl.create(:appointment) }

  xit 'has a date' do
    expect(appointment.date).to eq('06-14-2016')
  end

  it 'has start and finish time values' do
    expect(appointment.start.to_s).to eq('2016-06-14 13:00:00 UTC')
    expect(appointment.finish.to_s).to eq('2016-06-14 14:00:00 UTC')
  end


  it 'belongs to a user' do
    appointment.user = FactoryGirl.build(:user)
    appointment.save
    expect(appointment.user_id).to eq(1)
  end

  it 'belongs to a stylist' do
    appointment.stylist = FactoryGirl.build(:stylist)
    appointment.save
    expect(appointment.stylist_id).to eq(1)
  end

  it 'queries for appointments today' do
    todays_appointment = FactoryGirl.build(:todays_appointment)
  end
end
