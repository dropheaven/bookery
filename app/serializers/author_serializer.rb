class AuthorSerializer < ActiveModel::Serializer
  attributes :full_name, :bio
  has_many :books
end