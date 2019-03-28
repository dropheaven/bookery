class BookSerializer < ActiveModel::Serializer
  attributes :title, :release_year
  belongs_to :author, serializer: BookAuthorSerializer
  belongs_to :genre, serializer: BookGenreSerializer
  has_many :comments, serializer: BookCommentSerializer
end
