class Comment < ApplicationRecord
  validates :content, {presence: true, length: {minimum: 1, maximum: 150}}
  validates :user_id, {presence: true}
  validates :item_id, {presence: true}
    
  belongs_to :user
  belongs_to :item
end
