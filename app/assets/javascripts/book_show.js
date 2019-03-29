document.addEventListener('turbolinks:load', () => {
  const button = document.querySelector('.btn.btn-success');
  if (!button) return; // not on book#show if this gets executed
  

  button.addEventListener('click', (event) => {
    let addOne = parseInt(button.dataset.book) + 1
    let url = `/authors/${button.dataset.author}/books/${addOne}.json`;

    fetch(url)
      .then(response => response.json())
      .then(book => {
        document.querySelector('h2').textContent = book.title;
        document.querySelector('#genre').textContent = book.genre.name;
        document.querySelector('#release').textContent = book.release_year;
        
        button.dataset.book = addOne.toString();
      });
  });
});


