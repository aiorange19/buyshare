class CreateItemCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :item_categories, comment: '商品-カテゴリー紐付けテーブル' do |t|
      t.references :item, comment: '商品id'
      t.references :category, comment: '商品カテゴリーid'

      t.timestamps
    end
  end
end
