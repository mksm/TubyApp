class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :youtube_id
      t.integer :channel_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Video.create_translation_table! name: :string
      end

      dir.down do
        Video.drop_translation_table!
      end
    end

  end
end
