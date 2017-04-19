namespace :tasks do
  desc "compare and updates videos list for each channel"
  task update_videos_in_channel: :environment do
    Channel.all.each do |channel|
      Rails.logger.debug "Updating videos for : #{channel.name_en}"
      channel.update_videos_in_channel
    end
  end

end
