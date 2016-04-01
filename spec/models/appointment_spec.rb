describe 'Appointment' do
  # start: 2016-06-14 13:00:00 -0400
  # finish: 2016-06-14 14:00:00 -0400
  let(:appointment) { FactoryGirl.build_stubbed(:appointment) }

  it 'uses .parse_datetime for start and finish values' do
    expect(appointment.start.to_s).to eq('2016-06-14 13:00:00 -0400')
    expect(appointment.finish.to_s).to eq('2016-06-14 14:00:00 -0400')
  end

end
