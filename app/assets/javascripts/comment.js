class Comment {
  constructor(username, content, postedAt) {
    this.username = username;
    this.content = content;
    this.postedAt = postedAt;
  }
}

const commentEventListener = () => {
  const commentButton = document.querySelector('#comment-btn');
  if (!commentButton) return;
  
  commentButton.addEventListener('click', (event) => {
    event.preventDefault();
    let commentContent =  document.querySelector('.new_comment').elements[3].value;
    const userId = document.querySelector('.new_comment').elements[2].value;
    const bookId = document.querySelector('.btn.btn-success').dataset.book;

    fetch('/comments', {
      method: 'post',
      body: JSON.stringify({ id: userId, book_id: bookId, content: commentContent }),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': Rails.csrfToken()
      },
      credentials: 'same-origin'
    })
      .then(response => response.json())
      .then(book => {
        const comment = makeComment(book.comments[book.comments.length - 1])
        document.querySelector('ul.list-unstyled').innerHTML += comment;
        document.querySelector('.new_comment').elements[3].value = "";
      });
  });
};

/* helper function */

const makeComment = (commentObj) => {
  const comment = new Comment(commentObj.username, commentObj.content, commentObj.posted_at);
  return `
    <li class="media">
      <div class="media-body">
      <span class="mt-0">${comment.username}</span>
      <span class="post-time float-right">${comment.postedAt}</span>
      <blockquote>${comment.content}</blockquote>
      </div>
    </li>
  `;
};