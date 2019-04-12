class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :author_name, :genre_name
  belongs_to :author, serializer: BookAuthorSerializer
  belongs_to :genre, serializer: BookGenreSerializer
  has_many :comments, serializer: BookCommentSerializer
end
