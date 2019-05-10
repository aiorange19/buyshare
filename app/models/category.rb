class Category < ApplicationRecord
  validates :name, presence:true, length:{maximum:50}

  has_many :items, through: :items_categories
  has_many :items_categories, dependent: :destroy
end
