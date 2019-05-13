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

  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories

  accepts_nested_attributes_for :images

  def save_categories(tags)
    current_tags = self.categories.pluck(:name) unless self.categories.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.categories.delete Category.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      article_category = Category.find_or_create_by(name:new_name)
      self.categories << article_category
    end
  end

end
