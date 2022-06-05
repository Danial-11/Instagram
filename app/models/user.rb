# frozen_string_literal: true

# user model
class User < ApplicationRecord
  include Followable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :stories, dependent: :destroy
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :email, presence: true, format: Devise.email_regexp, uniqueness: true
  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password,
               'Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
