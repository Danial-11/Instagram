# frozen_string_literal: true

# story image model
class StoryImage < ApplicationRecord
  belongs_to :story
  mount_uploader :image, ImageUploader
end
