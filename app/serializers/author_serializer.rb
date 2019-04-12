class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :bio
  has_many :books
end