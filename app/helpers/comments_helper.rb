module CommentsHelper
  def posted_on(comment)
    comment.updated_at.strftime("Posted on %A, %b %e, at %l:%M %p")
  end
end