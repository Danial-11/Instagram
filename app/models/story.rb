# frozen_string_literal: true

# Story model
class Story < ApplicationRecord
  belongs_to :user
  has_many :story_images, dependent: :destroy
  validates :caption, presence: true
  # scope :recent, -> { where('created_at >= :two_minutes_ago', two_minutes_ago: Time.now - 2.minutes) }
end
