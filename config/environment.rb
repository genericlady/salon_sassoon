ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  set :database, "sqlite3:db/sassoon#{ENV['SINATRA_ENV']}.db"
end

require_all 'app'
