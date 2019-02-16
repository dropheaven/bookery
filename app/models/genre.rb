class Genre < ActiveRecord::Base
  has_many :books
  has_many :authors, through: :books

  validates :name, presence: true, uniqueness: true
end