require_relative 'config/environment'
require './app/controllers/application_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# set :server, ['webrick', 'thing']
set :server, 'webrick'

use Rack::MethodOverride
use StylistsController
use AppointmentsController
use UsersController
run ApplicationController
