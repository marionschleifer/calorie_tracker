desc "This task is called by the Heroku scheduler add-on"
task :send_reminder => :environment do
  User::MissingEntriesReminderJob.run
end
