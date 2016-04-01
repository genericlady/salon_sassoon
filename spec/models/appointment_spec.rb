describe 'Appointment' do
  # start: 2016-06-14 13:00:00 -0400
  # finish: 2016-06-14 14:00:00 -0400
  let(:appointment) { FactoryGirl.build_stubbed(:appointment) }

  it 'has a date' do
    expect(appointment.date).to eq('06-14-2016')
  end

  it 'has start and finish time values' do
    expect(appointment.start.to_s).to eq('2016-06-14 13:00:00 UTC')
    expect(appointment.finish.to_s).to eq('2016-06-14 14:00:00 UTC')
  end

  it 'normalizes time data' do
    start_time = appointment.start
    finish_time = appointment.finish
    expect(appointment.normalize_time(start_time)).to eq('1:00pm')
    expect(appointment.normalize_time(start_time)).to eq('2:00pm')
  end

end
