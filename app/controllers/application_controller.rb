class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "stuffandthings"
  end

  get '/' do
    erb :home
  end

  helpers do
    def partial(template, *args)
      options = args.extract_options!
      options.merge!(:layout => false)
      if collection = options.delete(:collection) then
        collection.reduce([]) do |memo, member|
          memo << erb(template, options.merge(
                                    :layout => false,
                                    :locals => {template.to_sym => member}
                                  )
                       )
        end.join("\n")
      else
        erb(template, options)
      end
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=You have to be logged in to do that"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

end
