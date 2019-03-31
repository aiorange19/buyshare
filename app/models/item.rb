class Item < ApplicationRecord
  validates :content, {length: {minimum: 1, maximum: 300}}
  validates :buy_place, {length: {maximum: 50}}
  validates :price, {numericality: {only_integer: true} }
  validates :user_id, {presence: true}
    
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :wants
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :images

end
