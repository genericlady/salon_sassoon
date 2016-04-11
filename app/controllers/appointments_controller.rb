class AppointmentsController < ApplicationController
  get '/appointments' do
    redirect_if_not_logged_in
    @appointments = Appointment.all
    erb :'appointments/index'
  end

  get '/appointments/new' do
    redirect_if_not_logged_in
    @appointment = Appointment.new
    @error_message = params[:error]
    erb :'appointments/new'
  end

  post '/appointments' do
    redirect_if_not_logged_in
    if Appointment.valid_params?(appointment_params)
      # @appointment = Appointment.new_by_hash(appointment_params)
      @appointment = Appointment.new
      @appointment.date = appointment_date
      @appointment.start = appointment_start
      @appointment.finish = appointment_finish
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

  # helpers do
  #   def partial(page, options={})
  #     erb page, options.merge!(:layout => false)
  #   end
  # end
  helpers do
    def partial(template, *args)
      options = args.extract_options!
      options.merge!(:layout => false)
      if collection = options.delete(:collection) then
        collection.inject([]) do |buffer, member|
          buffer << erb(template, options.merge(
                                    :layout => false,
                                    :locals => {template.to_sym => member}
                                  )
                       )
        end.join("\n")
      else
        erb(template, options)
      end
    end
  end

  private
  def appointment_start
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
