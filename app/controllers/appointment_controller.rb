class AppointmentController < ApplicationController

  get '/appointments' do
    redirect_if_not_logged_in
    @appointments = Appointment.all
    erb :'appointments/index'
  end

  get '/appointments/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'appointments/new'
  end

  post '/appointments' do
    redirect_if_not_logged_in
    unless Appointment.valid_params?(params)
      redirect "/appointments/new?error=invalid appointment"
    end
    @appointment = Appointment.new
    @appointment.start = Chronic.parse(params[:start])
    @appointment.finish = Chronic.parse(params[:finish])
    @appointment.save
    redirect '/appointments'
  end

  get '/appointments/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @appointment = Appointment.find(params[:id])
    erb :'appointments/edit'
  end

  post '/appointments/:id' do
    redirect_if_not_logged_in
    @appointment = Appointment.find(params[:id])
    unless Appointment.valid_params?(params)
      redirect "/appointments/#{@appointment.id}/edit?error=invalid appointment"
    end
    @appointment.update(params.select{ |key| key == 'start' || key == 'finish' || key == 'stylist_id' })
    redirect "/appointments/#{@appointment.id}"
  end

  get '/appointments/:id' do
    redirect_if_not_logged_in
    @appointment = Appointment.find(params[:id])
    erb :'appointments/show'
  end

end
