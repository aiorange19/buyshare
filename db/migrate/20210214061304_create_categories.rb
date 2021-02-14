class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, comment: '商品カテゴリーマスターデータ' do |t|
      t.string :name, comment: 'カテゴリー名'
      t.timestamps
    end
  end
end
