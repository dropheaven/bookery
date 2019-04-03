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