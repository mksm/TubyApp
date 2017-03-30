class ChangeCategoryToChannelInVideos < ActiveRecord::Migration[5.0]
  def change
    rename_column :videos, :category_id, :channel_id
  end
end
