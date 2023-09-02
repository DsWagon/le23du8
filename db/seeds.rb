# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Creating users, flats and syndics..."

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

syndic = Syndic.create!(
  name: "Balma gestion",
  description: "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
  address: "14 rue de la cloche percee, 75010 Paris",
  email: "Balmagestion@gmail.com",
  phone: "0145678901"
)

puts "Finished!"
