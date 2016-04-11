class StylistsController < ApplicationController

  get '/stylists' do
    redirect_if_not_logged_in
    @stylists = Stylist.all
    erb :'stylists/index'
  end

  get '/stylists/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'stylists/new'
  end

  post '/stylists' do
    redirect_if_not_logged_in
    unless Stylist.valid_params?(params)
      redirect "/stylists/new?error=invalid stylist"
    end
    @stylist = Stylist.new
    @stylist.name = params[:name]
    @stylist.save
    redirect '/stylists'
  end

  get '/stylists/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @stylist = Stylist.find(params[:id])
    erb :'stylists/edit'
  end

  post '/stylists/:id' do
    redirect_if_not_logged_in
    @stylist = Stylist.find(params[:id])
    unless Stylist.valid_params?(params)
      redirect "/stylists/#{@stylist.id}/edit?error=invalid stylist"
    end
    @stylist.update(params.select{ |key| key == 'start' || key == 'finish' || key == 'stylist_id' })
    redirect "/stylists/#{@stylist.id}"
  end

  get '/stylists/:id' do
    redirect_if_not_logged_in
    @stylist = Stylist.find(params[:id])
    erb :'stylists/show'
  end

end
