class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes, comment: 'いいねデータ' do |t|
      t.references :user, comment: 'user_id'
      t.references :item, comment: 'item_id'

      t.timestamps
    end
  end
end
