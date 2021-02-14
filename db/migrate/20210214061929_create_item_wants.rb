class CreateItemWants < ActiveRecord::Migration[6.0]
  def change
    create_table :item_wants, comment: '買いたいデータ' do |t|
      t.references :user, comment: 'user_id'
      t.references :item, comment: 'item_id'

      t.timestamps
    end
  end
end
