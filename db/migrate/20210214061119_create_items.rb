class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items, comment: '投稿商品データ' do |t|
      t.text :content, comment: '内容'
      t.string :buy_place, comment: '購入場所'
      t.integer :price, comment: '値段'
      t.references :user
      t.timestamps
    end
  end
end
