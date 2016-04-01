class AppointmentController < ApplicationController

  get '/appointments/new' do
    erb :'appointments/new'
  end

  post '/appointments' do
    @appointment = Appointment.new
    @appointment.start = Appointment.parse_datetime(params[:start])
    @appointment.finish = Appointment.parse_datetime(params[:finish])
    @appointment.save
    redirect '/appointments/index'
  end

  get '/appointments/index' do
    @appointments = Appointment.all
    erb :'appointments/index'
  end

  get '/appointments/:id' do
    @appointment = Appointment.find params[:id]
    erb :'appointments/show'
  end
end
