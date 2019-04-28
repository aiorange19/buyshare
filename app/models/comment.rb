class Comment < ApplicationRecord
  validates :content, {presence: true, length: {minimum: 1, maximum: 150}}
    
  belongs_to :user
  belongs_to :item
end
