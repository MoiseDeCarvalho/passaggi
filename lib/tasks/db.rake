

namespace :app do

  # esegue controllo che non siamo in produzione per cancellare i dati.
  puts "avvio"
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      puts "\nMi dispiace non posso farlo.\n(Mi stai chiedendo di cancellare il database di produzione.)"
      raise "\nMi dispiace non posso farlo.\n(Mi stai chiedendo di cancellare il database di produzione.)"
    end
  end
  
  # Installazione per ambiente di sviluppo
  desc "Install environment "
  task :install => [:ensure_development_environment, "db:migrate", "db:test:prepare", "db:seed", "app:populate", "spec"]

  # Custom reset for developement environment
  desc "Reset"
  task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:test:prepare", "db:seed", "app:populate"]

  # Populates development data
  desc "Populate the database with development data. please one moment"
  task :populate => :environment do
    puts "#{'*'*(`tput cols`.to_i)}\nChecking Environment... The database will be cleared of all content before populating.\n#{'*'*(`tput cols`.to_i)}"
    # Removes content before populating with data to avoid duplication
    Rake::Task['db:reset'].invoke

    # INSERT BELOW

    [
      {   :name => "Moise", 
          :email => "moise@moise.it", 
          :encrypted_password => "$2a$12$/Ky6zqRB87.a9lHnf1A9WeKLefp2bwAZmKXoczHGEWy.u8.qxvPIG",
          :created_at => "2020-09-04 19:09:43",
          :updated_at => "2020-09-05 07:52:21",
          :type_user => 1},
    ].each do |attributes|
      sign_in users(attributes)
    end




    # INSERT ABOVE

    puts "#{'*'*(`tput cols`.to_i)}\nThe database has been populated!\n#{'*'*(`tput cols`.to_i)}"
  end

end