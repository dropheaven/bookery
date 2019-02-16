class Author < ActiveRecord::Base
  has_many :books
  has_many :genres, through: :books

  validates :first_name, presence: true, uniqueness: { scope: [:middle_name, :last_name], message: "Author already exists" }
  validates :last_name, presence: true

  def full_name
    if middle_name != nil
      (first_name + " " + middle_name + " " + last_name).titlecase
    else
      (first_name + " " + last_name).titlecase
    end
  end
end