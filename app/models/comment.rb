class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true

  def username
    User.find(user_id).username
  end
end