# frozen_string_literal: true

# Photo model
class Photo < ApplicationRecord
  belongs_to :post
  mount_uploader :image, ImageUploader
end
