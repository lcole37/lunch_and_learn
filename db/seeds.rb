# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(name: "Happy", email: "example@happyemail.com", api_key: "012345")

favorite1 = user1.favorites.create!(country: "Italy", recipe_link: "https//www.allrecipes.com", recipe_title: "Italian Recipe")
favorite2 = user1.favorites.create!(country: "Morocco", recipe_link: "https//www.goodeats.com", recipe_title: "Moroccan Recipe")
