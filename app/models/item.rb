class Item < ApplicationRecord
  validates :content, {presence: true, length: {minimum: 1, maximum: 300}}
  validates :buy_place, {length: {maximum: 50}}
  validates :price, {numericality: {only_integer: true} }
  validates :user_id, {presence: true}
    
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :wants
  has_many :images
  accepts_nested_attributes_for :images

  acts_as_taggable
end
