class Image < ApplicationRecord
    validates :image_name, {presence: true}
    
    belongs_to :item
   

end
