class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :comments
  has_many :users, -> { distinct }, through: :comments

  before_validation :make_title_case
  validates :title, presence: true, uniqueness: { scope: :author, message: "already exists" }

  scope :latest, -> { order("created_at desc") }

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name.downcase)
    self.genre = genre
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def author_full_name=(full_name)
    author = Author.find_or_create_by(full_name: full_name)
    self.author = author
  end

  def author_full_name
    self.author ? self.author.full_name : nil 
  end

  private
    def make_title_case
      # downcase first to avoid cases like "whaT IS this".titlecase => "Wha T Is This"
	    self.title = self.title.downcase.titlecase
    end
end