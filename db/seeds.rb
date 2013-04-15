# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

cat1 = Category.create(name: "People")
cat2 = Category.create(name: "Products")
cat3 = Category.create(name: "Experiences")

# Auction.create!(
#   title: "First Auction", 
#   description: Faker::Lorem.paragraph, 
#   start_date: (Time.now + 1.day), 
#   end_date: (Time.now + 2.weeks), 
#   category_id: cat1.id)

# Auction.create!(
#   title: "Second Auction", 
#   description: Faker::Lorem.paragraph, 
#   start_date: (Time.now + 2.days), 
#   end_date: (Time.now + 2.weeks), 
#   category_id: cat2.id)

# Auction.create!(
#   title: "Third Auction", 
#   description: Faker::Lorem.paragraph, 
#   start_date: (Time.now + 3.days), 
#   end_date: (Time.now + 2.weeks), 
#   category_id: cat3.id)

User.create!(
  name: "Kevin Ko",
  email: "kevin@kevin.com",
  password: "password",
  phone: "",
  time_donated: 9001,
  admin: true)

User.create!(
  name: "Philip Woo",
  email: "philip@philip.com",
  password: "password",
  phone: "",
  time_donated: 9001,
  admin: true)

User.create!(
  name: "David Wen",
  email: "david@david.com",
  password: "password",
  phone: "",
  time_donated: 9001,
  admin: true)

User.create!(
  name: "J Connolly",
  email: "connolly@connolly.com",
  password: "password",
  phone: "",
  time_donated: 9001,
  admin: true)
