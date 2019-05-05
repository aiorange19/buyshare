class DestroyTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :item_categories
    drop_table :categories
  end
end
