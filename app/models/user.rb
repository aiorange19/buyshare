class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password
    
  validates :name, {presence: true}
    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  validates :image_name, {presence: true}
  
  has_many :items
  has_many :likes
  has_many :comments
  has_many :wants
    
  def has_item?(item)
    id == item.user_id
  end   
end
