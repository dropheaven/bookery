class BookCommentSerializer < ActiveModel::Serializer
  attributes :username, :content, :created_at
end
