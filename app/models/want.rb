class Want < ApplicationRecord
  validates :user_id, {presence: true}
  validates :item_id, {presence: true}
    
  belongs_to :item, optional: true
end
