# frozen_string_literal: true

# post model
class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }
  has_many :comments, -> { order(created_at: :desc) }
  validates :content, presence: true

  def is_liked(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
