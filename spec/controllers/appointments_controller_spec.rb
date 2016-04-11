=begin
`build(:project)` which returns an object that has not been saved to the db
`create(:project)` returns an object that saves to the db
`attributes_for(:project)` is great for testing params since it returns
the attributes as a hash.
`build_stubbed(:project)` like build it returns an unsaved object but assigns
a fake ActiveRecord ID to the model and stubs out database interaction methods
like (save).  This will make sure it raises exceptions if they are called.
=end
describe AppointmentsController do
  # start: 2016-06-14 13:00:00 -0400
  # finish: 2016-06-14 14:00:00 -0400
  let(:appointment_stub) { FactoryGirl.build_stubbed(:appointment) }
  let(:saved_appointment) { FactoryGirl.create(:appointment) }

  describe 'Creating a New Appointment' do
    it 'get /appointments/new' do
      get '/appointments/new'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Create New Appointment")
      expect(last_response.body).to include('form')
      expect(last_response.body).to include('start')
      expect(last_response.body).to include('finish')
    end
  end

  describe 'POST New Appointment Creation Data as Params' do
    it 'post /appointments' do
      params = attributes_for(:appointment)
      post '/appointments', params
      expect(last_response.location).to include("/appointments/index")
    end
  end

  describe 'Index Page' do
    it  'get /appointments/index' do
      get '/appointments/index'
      expect(last_response.status).to eq(200)
      # expect(last_response.body).to include('Appointments')
    end
  end

  describe 'List Individual Appointment' do
    it 'get /appointments/show/:id' do
      appointment = FactoryGirl.build(:appointment)
      appointment.start = Chronic.parse('4/12/2016 5:00pm')
      appointment.finish = Chronic.parse('4/12/2016 6:00pm')
      appointment.save
      get "/appointments/#{appointment.id}"
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("2016-04-12 17:00:00 UTC")
      expect(last_response.body).to include("2016-04-12 18:00:00 UTC")
    end
  end

  xdescribe 'Update an existing Appointment' do
  end

  xdescribe 'Delete an existing Appointment' do
  end
end
