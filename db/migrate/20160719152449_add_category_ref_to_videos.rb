class AddCategoryRefToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :category_id, :integer
  end
end
