class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :books, -> { distinct }, through: :comments

  validates :username, presence: true, length: { in: 2..20 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false },
  format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
end
