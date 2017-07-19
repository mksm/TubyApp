class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :youtube_id
      t.string :icon

      t.timestamps
    end
  end
end
