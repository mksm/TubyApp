class AddHiddenToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :hidden, :boolean, default: false, null: false
  end
end
