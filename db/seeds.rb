# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Genre Non-fiction
non_fiction = Genre.create(name: "Non fiction")
yuval = Author.create(full_name: "Yuval Noah Harari", bio: "Yuval Noah Harari is an Israeli historian and a tenured professor in the Department of History at the Hebrew University of Jerusalem. He is the author of the international bestsellers Sapiens: A Brief History of Humankind, Homo Deus: A Brief History of Tomorrow, and 21 Lessons for the 21st Century")
yuval.books.create(title: "Sapiens", release_date: 2011, genre: non_fiction)
yuval.books.create(title: "Homo Deus", release_date: 2015, genre: non_fiction)
yuval.books.create(title: "21 Lessons for the 21st Century", release_date: 2018, genre: non_fiction)
sam_harris = Author.create(full_name: "Sam Harris", bio: "Samuel Benjamin Harris is an American neuroscientist, author, critic of religion, blogger, public intellectual, and podcast host")
sam_harris.books.create(title: "The End of Faith", release_date: 2004, genre: non_fiction)
sam_harris.books.create(title: "The Moral Landscape", release_date: 2010, genre: non_fiction)
sam_harris.books.create(title: "Free Will", release_date: 2012, genre: non_fiction)
sam_harris.books.create(title: "Waking Up", release_date: 2014, genre: non_fiction)

#Genre Fantasy
fantasy = Genre.create(name: "Fantasy")
nk_jemisin = Author.create(full_name: "N.K. Jemisin", bio: "Nora K. Jemisin is an American science fiction and fantasy writer and a psychologist. Her fiction explores a wide variety of themes, including cultural conflict and oppression. She has won several awards for her work, including the Locus Award.")
nk_jemisin.books.create(title: "The Killing Moon", release_date: 2012, genre: fantasy)
nk_jemisin.books.create(title: "The Fifth Season", release_date: 2015, genre: fantasy)
nk_jemisin.books.create(title: "The Obelisk Gate", release_date: 2016, genre: fantasy)
nk_jemisin.books.create(title: "The Stone Sky", release_date: 2017, genre: fantasy)
patrick_rothfuss = Author.create(full_name: "Patrick Rothfuss", bio: "Patrick James Rothfuss is an American writer of epic fantasy. He is best known for his series The Kingkiller Chronicle, which won him several awards, including the 2007 Quill Award for his debut novel, The Name of the Wind. Its sequel, The Wise Man's Fear, topped The New York Times Best Seller list")
patrick_rothfuss.books.create(title: "The Name of the Wind", release_date: 2007, genre: fantasy)
patrick_rothfuss.books.create(title: "TThe Wise Man's Fear", release_date: 2011, genre: fantasy)
patrick_rothfuss.books.create(title: "The Slow Regard of Silent Things", release_date: 2014, genre: fantasy)

p "Created #{Genre.count} genres, #{Author.count} authors, #{Book.count} books"