class AddChannelTranslationTable < ActiveRecord::Migration[5.0]
  def self.up
    create_table :channel_translations do |t|
      t.integer :channel_id   , null: false
      t.string :locale        , null: false
      t.datetime :created_at  , null: false
      t.datetime :updated_at  , null: false
      t.string :name
    end
    add_index :channel_translations, :channel_id, name: "index_channel_translations_on_channel_id"
    add_index :channel_translations, :locale,  name: "index_channel_translations_on_locale"
  end

  def self.down
    drop_table :channel_translations
  end
end
