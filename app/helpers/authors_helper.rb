module AuthorsHelper
  def titleize(author)
    author.full_name.titleize
  end
end