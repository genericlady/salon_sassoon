class ApplicationController < Sinatra::Base
  configure do
    # set :public_folder, 'public'
    enable :sessions unless test?
    set :session_secret, "secret"
    set :views, 'app/views'
  end

  get '/' do
    erb :home
  end
end
