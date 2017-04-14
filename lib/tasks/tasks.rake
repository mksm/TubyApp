namespace :tasks do
  desc "import csv to channels passing the file's route as an arg"
  task :import_csv_channels , [:arg1] => :environment do |t, args|
    csv_text = File.open(File.join(Rails.root,'db', args[:arg1])).read
    Channel.import_csv(csv_text)
  end
end
