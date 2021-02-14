class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :likes
  has_many :comments
  has_many :wants
    
  validates :name, {presence: true}
    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

    
  def has_item?(item)
    id == item.user_id
  end
    
 def has_comment?(comment)
    id == comment.user_id
 end
end
