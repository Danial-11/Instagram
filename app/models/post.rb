# frozen_string_literal: true

# Post model
class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def isliked(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
