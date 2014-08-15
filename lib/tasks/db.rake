require 'csv'

namespace :db do
  desc "Show all user's names"
  # adding the environment dependency allows you to pull in the rails environment
  ## :environment is a rake task defined by Rails that can access Rails models, classes, etc
  task :show_names => :environment do
    names = User.pluck(:name)
    puts "User names are #{names.join(', ')}"
  end

  desc "Export users to csv"
  task :export_users_csv => :environment do
    app_root = Rails.root.to_s
    sh "mkdir #{app_root}/backups"
    sh "touch #{app_root}/backups/users.csv"

    column_names = User.column_names
    users = User.all

    CSV.open("#{app_root}/backups/users.csv", "w+") do |csv|
      csv.truncate(0)
      csv << column_names
      users.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

  desc "Import users from backup"
  task :import_user_csv => [:environment] do
    app_root = Rails.root.to_s
    User.destroy_all
    CSV.foreach("#{app_root}/backups/users.csv", headers: true) do |row|
      User.create!(name: row["name"], email: row["email"])
    end
  end
end
