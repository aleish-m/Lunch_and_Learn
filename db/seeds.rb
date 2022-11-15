# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{name: Faker::Name.name, email: Faker::Internet.email}, {name: Faker::Name.name, email: Faker::Internet.email}]) 

# user.first = name: "Mr. Ben Grant", email: "jermaine.robel@block.com", api_key: "KHIs1RkntYbttRC1-Esqjw"

# user.last = name: "Leigha Mertz", email: "kelley_cronin@pagac.net", api_key: "IA46k4_aQusyVC1f5NHtgw"

Favorite.create([
  {user: users.first, recipe_link: Faker::Internet.url, recipe_title: Faker::Food.dish, country: Faker::Address.country}, 
  {user: users.first, recipe_link: Faker::Internet.url, recipe_title: Faker::Food.dish, country: Faker::Address.country}, 
  {user: users.first, recipe_link: Faker::Internet.url, recipe_title: Faker::Food.dish, country: Faker::Address.country}, 
  {user: users.first, recipe_link: Faker::Internet.url, recipe_title: Faker::Food.dish, country: Faker::Address.country},
  {user: users.last, recipe_link: Faker::Internet.url, recipe_title: Faker::Food.dish, country: Faker::Address.country}])