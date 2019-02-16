class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :genre

  before_validation :make_title_case
  validates :title, presence: true, uniqueness: true
  validates :release_date, presence: true

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def author_full_name=(full_name)
    author = Author.find_by(full_name: full_name)
    self.author = author
  end

  def author_full_name
    self.author ? self.author.full_name : nil 
  end

  private
	  def is_title_case
	    if title.split.any?{|w|w[0].upcase != w[0]}
		  errors.add(:title, "Title must be in title case")
		 end
	   end
   
    def make_title_case
      # downcase first to avoid cases like "whaT IS this".titlecase => "Wha T Is This"
	    self.title = self.title.downcase.titlecase
    end
end