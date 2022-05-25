# frozen_string_literal: true

# user model
class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :stories, dependent: :destroy
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :email, presence: true, format: Devise.email_regexp, uniqueness: true
end
