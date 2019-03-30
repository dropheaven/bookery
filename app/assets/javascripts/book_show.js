document.addEventListener('turbolinks:load', () => {  
  const mbButton = document.querySelector('.btn.btn-success');
  if (!mbButton) return; // not on book#show if this gets executed

  mbButton.addEventListener('click', event => {
    const addOne = parseInt(mbButton.dataset.book) + 1
    const url = `/authors/${mbButton.dataset.author}/books/${addOne}.json`;

    fetch(url)
      .then(response => response.json())
      .then(book => {
        updateBookDetails(book);
        mbButton.dataset.book = addOne.toString();
      });
  });

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
});

class Book {
  constructor(title, releaseYear, author, genre, comments) {
    this.title = title;
    this.releaseYear = releaseYear;
    this.author = author;
    this.genre = genre;
    this.comments = comments;
  }

   titleize() {
    const titleized = [];
    this.author.split(' ').forEach((name) => {
      const splitFurther = name.split('');
      if (splitFurther.some(char => char === '.' || char === '-')) {
        let withIntials = "";
        splitFurther.forEach(char => withIntials += char.toUpperCase());
        titleized.push(withIntials);
      } else {
        titleized.push(name[0].toUpperCase() + name.slice(1).toLowerCase());
      }
    });

    return titleized.join(' ');
  }
}

const updateBookDetails = json => {
  const book = new Book(json.title, json.release_year, json.author.full_name, json.genre.name, json.comments);
  document.querySelector('h2').textContent = book.title;
  document.querySelector('#release').textContent = book.releaseYear;
  document.querySelector('h5').textContent = `by ${book.titleize()}`;
  document.querySelector('#genre').textContent = book.genre;
  displayComments(book.comments);
};

const displayComments = commentsArray => {
  const commentsList = document.querySelector('ul.list-unstyled');
  commentsList.innerHTML = "";
  let commentBody = "";

  commentsArray.forEach(comment => {
    commentBody += makeComment(comment);
  });

  commentsList.innerHTML = commentBody; 
};

const makeComment = (comment) => {
  return `
    <li class="media">
      <div class="media-body">
      <span class="mt-0">${comment.username}</span>
      <span class="post-time float-right">${comment.posted_at}</span>
      <blockquote>${comment.content}</blockquote>
      </div>
    </li>
  `;
};


