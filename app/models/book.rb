class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :genre

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
end