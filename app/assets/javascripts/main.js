/*----------------------------------- go to Author's book index page from root -------------------------------------------------------------*/

const authorBooks = () => {
  const row = document.querySelector('.row.text-center');
  if (!row) return;

  row.addEventListener('click', (e) => {
    if(e.target.className === 'author-link') {
      e.preventDefault();
      
      fetch(`/authors/${e.target.dataset.id}`)
        .then(response => response.json())
        .then(author => updateAuthorBooks(author));
    }
  });
};

const updateAuthorBooks = (authorObj) => {
  const author = new Author(authorObj.id, authorObj.full_name, authorObj.bio, authorObj.books);
  const jumbotron = document.querySelector('.jumbotron');
  jumbotron.innerHTML = "";
  const h1 = `
    <h1 class="display-5">${author.titleize()}</h1>
    <p class="lead">${author.bio}</p>
  `;
  jumbotron.innerHTML += h1;

  const row = document.querySelector('.row.text-center');
  row.innerHTML = "";

  author.books.forEach(b => {
    const book = new Book(b.title, b.release_year, author, b.genre_name);
    row.innerHTML += bookContainer(book);
  });

  window.scrollTo(0, 0);
};

const bookContainer = book => {
  return `
    <div class="col-lg-3 col-md-6 mb-4">
      <div class="card h-100">
        <img class="card-img-top" src=${book.randomBookLink()} width="253" height="177">
        <div class="card-body">
          <h4 class="card-title">${book.title}</h4>
          <p class="card-text">
            Genre: ${book.genre}<br />
            Release year: ${book.releaseYear}
          </p>
        </div>
        <div class="card-footer">
        </div>
      </div>
    </div>
  `
};

/*-------------------------------------------------- get next book from show page of a book --------------------------------------------------*/

const showBook = () => {
  const mbButton = document.querySelector('.btn.btn-success');
  if (!mbButton) return;

  mbButton.addEventListener('click', event => {
    const url = `/authors/${mbButton.dataset.author}`;
    const title = document.querySelector('#book-title').innerHTML;
    
    fetch(url)
      .then(response => response.json())
      .then(author => {
        const indexOfCurrentBook = author.books.findIndex(book => book.title === title);
        updateBookDetails(author.books[indexOfCurrentBook + 1]);
      })
      .catch(error => {
        mbButton.style.visibility = "hidden";
        document.querySelector('#book-info').innerHTML += `<p>This is the last book in this author's collection.</p>`;
      });
  });
};

const updateBookDetails = json => {
  const book = new Book(json.id, json.title, json.release_year, json.full_name, json.genre_name, json.comments);
  document.querySelector('h2').textContent = book.title;
  document.querySelector('#release').textContent = book.releaseYear;
  document.querySelector('h5').textContent = `by ${book.title}`;
  document.querySelector('#genre').textContent = book.genre;
  document.querySelector('.btn-success').dataset.book = book.id.toString();
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

/* --------------------------------------------------------------- Post Comment ------------------------------------------------------------*/

const postComment = () => {
  const commentButton = document.querySelector('#comment-btn');
  if (!commentButton) return;
  
  commentButton.addEventListener('click', (event) => {
    event.preventDefault();
    let commentContent =  document.querySelector('.new_comment').elements[3].value;
    const userId = document.querySelector('.new_comment').elements[2].value;
    const bookId = document.querySelector('.btn-success').dataset.book;

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