# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Creating users, flats and syndics and meetings and comments, and quotes..."

alison = User.create!(
  email: "vip@gmail.com",
  password: "azerty",
  first_name: "Vip",
  last_name: "user",
  role: User.roles[:vip]
)

david = User.create!(
  email: "user@gmail.com",
  password: "azerty",
  first_name: "User",
  last_name: "user",
  role: User.roles[:user]
)

flat = Flat.create!(
  user: david,
  floor: 3,
  surface: 80,
  lot: 12
)

flat = Flat.create!(
  user: alison,
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

meeting1 = Meeting.create!(
  title: "ordre du jour 1",
  description: "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
  date: "2021-09-02",
  syndic: syndic,
)

meeting2 = Meeting.create!(
  title: "ordre du jour 2",
  description: "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
  date: "2022-01-02",
  syndic: syndic,
)


quote1 = Quote.create!(
  company_name: "entreprise 1",
  description: "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
  price: 1000,
  date_start: "2021-09-02",
  date_end: "2021-10-02",
  meeting: meeting1
)

quote2 = Quote.create!(
  company_name: "entreprise 2",
  description: "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
  price: 10000,
  date_start: "2022-09-02",
  date_end: "2022-09-02",
  meeting: meeting2
)

# comment1 = Comment.create!(
#   content: "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
#   user: david,
#   meeting: meeting1
# )

# comment2 = Comment.create!(
#   content: "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
#   user: david,
#   meeting: meeting2
# )

puts "Finished!"
