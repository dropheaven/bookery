################################## AUTHORS #########################################
nk_jemisin = Author.create(full_name: "N.K. Jemisin", bio: "Nora K. Jemisin is an American science fiction and fantasy writer and a psychologist. Her fiction explores a wide variety of themes, including cultural conflict and oppression. She has won several awards for her work, including the Locus Award.")

yuval = Author.create(full_name: "Yuval Noah Harari", bio: "Yuval Noah Harari is an Israeli historian and a tenured professor in the Department of History at the Hebrew University of Jerusalem. He is the author of the international bestsellers Sapiens: A Brief History of Humankind, Homo Deus: A Brief History of Tomorrow, and 21 Lessons for the 21st Century")

james_clear = Author.create(full_name: "James Clear")

patrick_rothfuss = Author.create(full_name: "Patrick Rothfuss", bio: "Patrick James Rothfuss is an American writer of epic fantasy. He is best known for his series The Kingkiller Chronicle, which won him several awards, including the 2007 Quill Award for his debut novel, The Name of the Wind. Its sequel, The Wise Man's Fear, topped The New York Times Best Seller list")

dan_brown = Author.create(full_name: "Dan Brown", bio: "Daniel Gerhard Brown is an American author most well known for his thriller novels, including the Robert Langdon stories, Angels & Demons, The Da Vinci Code, The Lost Symbol, Inferno and Origin.")

################################## GENRE #########################################
non_fiction = Genre.create(name: "Non fiction")
self_dev = Genre.create(name: "Self Development")
fantasy = Genre.create(name: "Fantasy")
thriller = Genre.create(name: "Thriller")

################################## BOOKS #########################################
nk_jemisin.books.create(title: "The Killing Moon", release_year: 2012, genre: fantasy)
nk_jemisin.books.create(title: "The Fifth Season", release_year: 2015, genre: fantasy)
nk_jemisin.books.create(title: "The Obelisk Gate", release_year: 2016, genre: fantasy)
nk_jemisin.books.create(title: "The Stone Sky", release_year: 2017, genre: fantasy)

yuval.books.create(title: "Sapiens", release_year: 2011, genre: non_fiction)
yuval.books.create(title: "Homo Deus", release_year: 2015, genre: non_fiction)
yuval.books.create(title: "21 Lessons for the 21st Century", release_year: 2018, genre: non_fiction)

james_clear.books.create(title: "Atomic Habits", release_year: 2018, genre: self_dev)

patrick_rothfuss.books.create(title: "The Name of the Wind", release_year: 2007, genre: fantasy)
patrick_rothfuss.books.create(title: "The Wise Man's Fear", release_year: 2011, genre: fantasy)
patrick_rothfuss.books.create(title: "The Slow Regard of Silent Things", release_year: 2014, genre: fantasy)

dan_brown.books.create(title: "Origin", release_year: 2017, genre: thriller)
dan_brown.books.create(title: "The Da Vinci Code", release_year: 2003, genre: thriller)
dan_brown.books.create(title: "Angels & Demons", release_year: 2000, genre: thriller)
dan_brown.books.create(title: "The Lost Symbol", release_year: 2009, genre: thriller)

################################## USERS #########################################
maha = User.create(username: "maha", email: "maha@email.com", password: "password")
james = User.create(username: "james", email: "james@email.com", password: "password")
lisa = User.create(username: "lisa", email: "lisa@email.com", password: "password")
zahran = User.create(username: "zahran", email: "zahran@email.com", password: "password")
ayaan = User.create(username: "ayaan", email: "ayaan@email.com", password: "password")
anaya = User.create(username: "anaya", email: "anaya@email.com", password: "password")

################################## COMMENTS #########################################
Comment.create(user_id: 1, book_id: 1, content: "loved this!")
Comment.create(user_id: 2, book_id: 1, content: "want to read!")
Comment.create(user_id: 3, book_id: 1, content: "fav")
Comment.create(user_id: 4, book_id: 1, content: "need to buy this")
Comment.create(user_id: 4, book_id: 2, content: "not a fan")
Comment.create(user_id: 5, book_id: 3, content: "highly recommend!")
Comment.create(user_id: 5, book_id: 4, content: "love her work")
Comment.create(user_id: 6, book_id: 5, content: "a must read!")
Comment.create(user_id: 6, book_id: 6, content: ":O")
Comment.create(user_id: 4, book_id: 8, content: "so helpful")
Comment.create(user_id: 5, book_id: 8, content: "yes^^")
Comment.create(user_id: 1, book_id: 12, content: "love dan brown")
Comment.create(user_id: 5, book_id: 13, content: "woowwo")
Comment.create(user_id: 6, book_id: 14, content: "will share with friends")
