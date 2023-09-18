# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating users, flats and syndics and meetings and comments, and quotes..."

User.destroy_all
Flat.destroy_all
Syndic.destroy_all
Meeting.destroy_all
Quote.destroy_all


puts "type of users: admin, vip, user"
odile = User.create!(
  email: "admin@gmail.com",
  password: "azerty",
  first_name: "Admin",
  last_name: "user",
  role: User.roles[:admin]
)

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

puts "build 20 more users"
users = []
20.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: "azerty",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: User.roles[:user]
  )
end

puts "build 20 more flats"
flats = []
20.times do
  flats << Flat.create!(
    user: users.sample,
    floor: rand(1..10),
    surface: rand(50..100),
    lot: rand(1..25)
  )
end


puts "type of flats for admin, vip, user"
flat_user = Flat.create!(
  user: david,
  floor: 3,
  surface: 80,
  lot: 12
)

flat_vip = Flat.create!(
  user: alison,
  floor: 3,
  surface: 80,
  lot: 12
)

flat_admin = Flat.create!(
  user: odile,
  floor: 3,
  surface: 80,
  lot: 12
)

puts "build 5 more syndics"
syndics = []
5.times do
  syndics << Syndic.create!(
    name: Faker::Company.name,
    description: Faker::Lorem.paragraph,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number
  )
end

balma = Syndic.create!(
  name: "Balma gestion",
  description: "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
  address: "14 rue de la cloche percee, 75010 Paris",
  email: "Balmagestion@gmail.com",
  phone: "0145678901"
)

puts "build 10 more meetings"
meetings = []
10.times do
  meetings << Meeting.create!(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    date: Faker::Date.between(from: 2.years.ago, to: Date.today),
    syndic: syndics.sample
  )
end
meeting1 = Meeting.create!(
  title: "ordre du jour 1",
  description: "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
  date: "2021-09-02",
  syndic: syndics.sample
)
meeting2 = Meeting.create!(
  title: "ordre du jour 2",
  description: "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
  date: "2022-01-02",
  syndic: syndics.sample
)

puts "build 20 more quotes"
quotes = []
20.times do
  quotes << Quote.create!(
    company_name: Faker::Company.name,
    description: Faker::Lorem.paragraph,
    price: rand(100..10000),
    date_start: Faker::Date.between(from: 2.years.ago, to: Date.today),
    date_end: Faker::Date.between(from: 2.years.ago, to: Date.today),
    meeting: meetings.sample
  )
end

10.times do
  post = Post.new(
    title: Faker::Lorem.sentence,
    content: Cicero.paragraphs(20),
    category: Post.categories.keys.sample,
    user: users.shift
  )
  post.save
end

puts "Finished!"
