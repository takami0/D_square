# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email: "guest@exam.com",
  password: "guestpass",
  name: "ゲスト",
  telephone_number: "00000000000",
  address: 0,
  category_medium_id: 1,
  occupation_id: 1,
  display_status: true,
  valid_status: true
  )

Admin.create!(email: "admin@exam.com",password: "adminpass")

