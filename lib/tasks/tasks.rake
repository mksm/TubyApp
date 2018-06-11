namespace :tasks do
  desc "compare and updates videos list for each channel"
  task update_videos: :environment do
    Channel.all.each do |channel|
      Rails.logger.debug "Updating videos for : #{channel.name_en}"
      channel.update_videos
    end
  end

  desc "Import csv to channels passing the file's path"
  task :import_csv_channels , [:arg1] => :environment do |t, args|
    csv_text = File.open(File.join(Rails.root,'db', args[:arg1])).read
    Channel.import_csv(csv_text)
  end
end
