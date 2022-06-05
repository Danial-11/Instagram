# frozen_string_literal: true

# post model
class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy
  validates :content, presence: true
end
