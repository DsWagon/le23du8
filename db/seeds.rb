# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


david = User.create!(
  email: "davidlog@gmail.com",
  password: "azerty",
  first_name: "David",
  last_name: "Log"
)

flat = Flat.create!(
  user: david,
  floor: 3,
  surface: 80,
  lot: 12
)
