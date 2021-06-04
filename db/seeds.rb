# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Test User", email: "test@testuser.com", password: "password123", password_confirmation: "password123")
admin = User.create(name: "Admin", email: "admin@example.com", password: "password123", password_confirmation: "password123")

# Bulk generate test users
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@testuser.com"
  password = "password123"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end

users = User.all
users.each do |user|
  debit_count = Faker::Number.within(range: 1..10)

  debit_count.times do |n|
    amt = Faker::Number.decimal(l_digits: 2)
    rmk = Faker::ChuckNorris.fact
    Debit.create!(frequency: "One time", currency: "USD", remarks: rmk, amount: amt, user_id: user.id)
  end
end