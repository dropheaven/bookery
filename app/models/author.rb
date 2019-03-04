class Author < ApplicationRecord
  has_many :books
  has_many :genres, -> { distinct }, through: :books

  before_validation :downcase_name
  validates :full_name, presence: true, uniqueness: true

  private
    def downcase_name
      full_name.downcase!
    end
end