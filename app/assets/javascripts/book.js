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