class BookCommentSerializer < ActiveModel::Serializer
  attributes :content, :created_at
end
