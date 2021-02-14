class CreateItemComments < ActiveRecord::Migration[6.0]
  def change
    create_table :item_comments, comment: '商品コメントデータ' do |t|
      t.text :content, comment: '投稿内容'
      t.references :user, comment: 'user_id'
      t.references :item, comment: 'item_id'

      t.timestamps
    end
  end
end
