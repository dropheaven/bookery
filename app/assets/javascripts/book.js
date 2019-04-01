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

const indexEventListener = () => {
  const row = document.querySelector('.row.text-center');
  if (!row) return;
  
  row.addEventListener('click', (e) => {
    if(e.target.className === 'author-link') {
      e.preventDefault();
      
      fetch(`/authors/${e.target.dataset.id}.json`)
        .then(response => response.json())
        .then(author => updateAuthorBooks(author));
    }
  });
};

const updateAuthorBooks = (authorObj) => {
  const row = document.querySelector('.row.text-center');
  row.innerHTML = "";

  authorObj.books.forEach(b => {
    const book = new Book(b.title, b.release_year, b.author_name, b.genre_name);
    row.innerHTML += bookContainer(book);
  });
};

const bookShowEventListener = () => {
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
};

/* helper functions */

const bookContainer = book => {
  return `
    <div class="col-lg-3 col-md-6 mb-4">
      <div class="card h-100">
        <img class="card-img-top" src="/assets/books/book-2.jpg" width="253" height="177">
        <div class="card-body">
          <h4 class="card-title">${book.title}</h4>
          <p class="card-text">
            Author: ${book.titleize()}<br />
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