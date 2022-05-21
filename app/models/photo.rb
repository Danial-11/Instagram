# frozen_string_literal: true

# photo model
class Photo < ApplicationRecord
  belongs_to :post

  mount_uploader :image, ImageUploader
end
