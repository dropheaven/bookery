document.addEventListener('turbolinks:load', () => {
  const nextBook = document.querySelector('.btn.btn-success');
  nextBook.addEventListener('click', (event) => {
    let addOne = parseInt(nextBook.dataset.book) + 1
    let url = `/authors/${nextBook.dataset.author}/books/${addOne}.json`;
    const title = document.querySelector('h2');
    const genre = document.querySelector('#genre');
    const releaseYear = document.querySelector('#release');



    fetch(url)
      .then(response => response.json())
      .then(book => {
        title.textContent = book.title;
        genre.textContent = book.genre.name;
        releaseYear.textContent = book.release_year;
        
        nextBook.dataset.book = addOne.toString();
      });
  });
  
});
