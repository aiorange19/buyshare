class Image < ApplicationRecord
    validates :image_name, {presence: true}
    
    belongs_to :item
    mount_uploaders :image_name, ItemimageUploader
   

end
