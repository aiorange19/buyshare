class Category < ApplicationRecord
  validates :name, presence:true, length:{maximum:50}

  has_many :items_categories, dependent: :destroy
  has_many :items, through: :items_categories
  
end
