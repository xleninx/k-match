desc "This task is called by the Heroku scheduler add-on"
task :check_connections => :environment do
  puts "Check Connections..."
  ConnectionChecker.new.check_connections
  puts "done."
end