
require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  # these two allow us to use PATCH, PUT, DELETE
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
