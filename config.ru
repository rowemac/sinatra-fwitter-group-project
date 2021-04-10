require './config/environment'
require_relative 'app/controllers/tweets_controller.rb'
require_relative 'app/controllers/users_controller.rb'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use TweetsController
use UsersController
run ApplicationController