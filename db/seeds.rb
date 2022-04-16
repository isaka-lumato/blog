# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Users
User.create(name: "Tom Hanks", photo: "https://cdn.pixabay.com/photo/2017/08/10/03/47/guy-2617866__340.jpg", bio: "Teacher from Mexico")
User.create(name: "George Donovan", photo: "https://cdn.pixabay.com/photo/2017/08/01/01/33/beanie-2562646__340.jpg", bio: "Astrophysicist from Canada")
User.create(name: "Nataly Cartman", photo: "https://cdn.pixabay.com/photo/2018/02/21/08/40/woman-3169726__340.jpg", bio: "Pharamicist from France")
Post.create(author_id: 1, title: "First Post", text: "This is my first post in this blog")
Post.create(author_id: 1, title: "Tulips", text: "Tulips (Tulipa) are a genus of spring-blooming perennial herbaceous bulbiferous geophytes (having bulbs as storage organs). The flowers are usually large, showy and brightly colored, generally red, pink, yellow, or white (usually in warm colors).")
Post.create(author_id: 1, title: "Chamomile", text: "Chamomile or camomile, is the common name for several daisy-like plants of the family Asteraceae. Two of the species, Matricaria recutita, and Anthemis nobilis are commonly used to make herbal infusions for beverages.")
Comment.create(author_id: 2, post_id: 1, text: "Well done Tommy!")
Comment.create(author_id: 3, post_id: 1, text: "You have mastered Rails, congradulations!")
Comment.create(author_id: 1, post_id: 1, text: "Thank you guys!")
Like.create(author_id: 2, post_id: 1)
Like.create(author_id: 3, post_id: 1)


