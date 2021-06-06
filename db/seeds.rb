User.create!(name: "Test User", email: "test@testuser.com", password: "password123", password_confirmation: "password123")
admin = User.create(name: "Admin", email: "admin@example.com", password: "password123", password_confirmation: "password123", admin: true)

admin.categories.create!(category_name: "Bills", is_system: true)
admin.categories.create!(category_name: "Subscriptions", is_system: true)
admin.categories.create!(category_name: "Rent", is_system: true)
admin.categories.create!(category_name: "Renter's Insurance", is_system: true)
admin.categories.create!(category_name: "Mortgage", is_system: true)
admin.categories.create!(category_name: "Home insurance", is_system: true)
admin.categories.create!(category_name: "Property Tax", is_system: true)
admin.categories.create!(category_name: "Extra Payment", is_system: true)
admin.categories.create!(category_name: "Food", is_system: true)
admin.categories.create!(category_name: "Travel", is_system: true)
admin.categories.create!(category_name: "Entertainment", is_system: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@testuser.com"
  password = "password123"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end

users = User.all
users.each do |user|
  debit_count = Faker::Number.within(range: 11..25)

  debit_count.times do |n|
    amt = Faker::Number.between(from: 3.0, to: 612.0).round(2)
    rmk = Faker::ChuckNorris.fact
    cat_num = Faker::Number.between(from: 1, to: 11)
    user.debits.create!(frequency: "One time", currency: "USD", remarks: rmk, amount: amt, category_id: cat_num)
  end
end