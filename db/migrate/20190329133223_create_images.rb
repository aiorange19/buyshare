class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image_name
      t.boolean :main_image
      t.integer :item_id

      t.timestamps
    end
  end
end
