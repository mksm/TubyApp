class AddIconToChannel < ActiveRecord::Migration[5.0]
  def change
    add_column :channels, :icon, :string
    Channel.all.each do |channel|
      if Yt::Channel.new(id: channel.youtube_id).present? and Yt::Channel.new(id: channel.youtube_id).thumbnail_url.present?
        yt_channel = Yt::Channel.new(id: channel.youtube_id)
        channel.icon = yt_channel.thumbnail_url
        channel.save!
      end
    end
  end
end
