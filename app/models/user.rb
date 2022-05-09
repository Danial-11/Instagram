class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.search(term)
    if term
      where('username LIKE ?', "%#{term}%")
    else
      nil
    end
  end
end