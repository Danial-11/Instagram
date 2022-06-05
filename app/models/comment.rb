# frozen_string_literal: true

# comments model
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, presence: true
end
