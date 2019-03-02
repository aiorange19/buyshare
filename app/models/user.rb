class User < ApplicationRecord
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :image_name, {presence: true}
  validates :password_digest, {presence: true}
    
  has_many :items
  has_many :likes
  has_many :comments
  has_many :wants
    
end
