class Genre < ApplicationRecord
  has_many :books
  has_many :authors, -> { distinct }, through: :books

  before_validation :make_downcase
  validates :name, presence: true, uniqueness: true

  private
    def make_downcase
	    name.downcase!
    end
end