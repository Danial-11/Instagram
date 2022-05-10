class Photo < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :story
  mount_uploader :image, ImageUploader
end
