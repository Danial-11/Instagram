# frozen_string_literal: true

# Like model
class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
