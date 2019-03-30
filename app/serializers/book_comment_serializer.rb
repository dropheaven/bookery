class BookCommentSerializer < ActiveModel::Serializer
  attributes :username, :content, :posted_at
end
