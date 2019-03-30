document.addEventListener('turbolinks:load', () => {  
  const button = document.querySelector('.btn.btn-success');
  if (!button) return; // not on book#show if this gets executed

  button.addEventListener('click', event => {
    const addOne = parseInt(button.dataset.book) + 1
    const url = `/authors/${button.dataset.author}/books/${addOne}.json`;

    fetch(url)
      .then(response => response.json())
      .then(book => {
        updateBookDetails(book);
        button.dataset.book = addOne.toString();
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
}

const updateBookDetails = json => {
  const book = new Book(json.title, json.release_year, json.author.full_name, json.genre.name, json.comments);
  document.querySelector('h2').textContent = book.title;
  document.querySelector('#release').textContent = book.releaseYear;
  document.querySelector('h5').textContent = book.author;
  document.querySelector('#genre').textContent = book.genre;
  commentsCreator(book.comments);
}

const commentsCreator = commentsArray => {
  const commentsList = document.querySelector('ul.list-unstyled');
  commentsList.innerHTML = "";
  let commentBody = "";

  commentsArray.forEach(comment => {
    commentBody += `
      <li class="media">
        <div class="media-body">
        <span class="mt-0"></span>
        <span></span>
        <blockquote>${comment.content}</blockquote>
        </div>
      </li>
    `;
  });

  commentsList.innerHTML = commentBody; 
}


