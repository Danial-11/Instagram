# frozen_string_literal: true

# Image Uploader
class ImageUploader < CarrierWave::Uploader::Base
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  include Cloudinary::CarrierWave

  process convert: 'png'
  process tags: ['post_picture']

  version :standard do
    process resize_to_fill: [300, 300, :north]
  end

  version :thumbnail do
    resize_to_fit(100, 100)
  end
end
