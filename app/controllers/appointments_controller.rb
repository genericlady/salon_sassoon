class AppointmentsController < ApplicationController

  get '/appointments' do
    redirect_if_not_logged_in
    @appointments = Appointment.all
    if @appointments.empty?
      erb :'appointments/new'
    else
      erb :'appointments/index'
    end
  end

  get '/appointments/new' do
    redirect_if_not_logged_in
    @user = current_user
    @appointment = @user.appointments.build appointment_params

    @error_message = params[:error]
    erb :'appointments/new'
  end

  post '/appointments' do
    redirect_if_not_logged_in
    if Appointment.valid_params?(appointment_params)
      @user = current_user
      # refactored with build
      @appointment = @user.appointments.build
      @appointment.date = Chronic.parse(appointment_date)
      @appointment.start = Chronic.parse(appointment_start)
      @appointment.finish = Chronic.parse(appointment_finish)
      @appointment.save
      redirect '/appointments'
    else
      redirect "/appointments/new?error=invalid appointment"
    end
  end

  get '/appointments/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @appointment = Appointment.find(params[:id])
    erb :'appointments/edit'
  end

  post '/appointments/:id' do
    redirect_if_not_logged_in
    set_appointment
    if Appointment.valid_params?(appointment_params)
      binding.pry
      @user = current_user
      # refactored with build
      @appointment = @user.appointments.build
      @appointment.date = appointment_date
      @appointment.start = Chronic.parse(appointment_start)
      @appointment.finish = Chronic.parse(appointment_finish)
      @appointment.save
      redirect "/appointments/#{@appointment.id}"
    else
      redirect "/appointments/#{@appointment.id}/edit?error=invalid appointment"
    end
  end

  get '/appointments/:id' do
    redirect_if_not_logged_in
    @appointment = Appointment.find(params[:id])
    erb :'appointments/show'
  end

  delete '/appointments/:id/delete' do
    redirect_if_not_logged_in
    set_appointment
    if @appointment.user_id == current_user.id
      @appointment.delete
      redirect '/appointments/new'
    else
      redirect '/login'
    end
  end

  private
  def appointment_hash

  end

  def appointment_start
    # '12/22/2016 4pm'
    appointment_date + ' ' + params[:appointment][:start]
  end

  def appointment_finish
    appointment_date + ' ' + params[:appointment][:finish]
  end

  def appointment_date
    params[:appointment][:date]
  end

  def appointment_params
    params[:appointment]
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

end
