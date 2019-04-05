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

  randomBookLink() {
    return `/assets/books/book-${Math.floor(Math.random() * 11) + 1}.jpg`
  }
}

class Author {
  constructor(fullName, bio, books) {
    this.fullName = fullName;
    this.bio = bio;
    this.books = books;
  }
  titleize() {
    const titleized = [];
    this.fullName.split(' ').forEach((name) => {
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

class Comment {
  constructor(username, content, postedAt) {
    this.username = username;
    this.content = content;
    this.postedAt = postedAt;
  }
}