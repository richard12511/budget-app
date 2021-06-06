User.create!(name: "Test User", email: "test@testuser.com", password: "password123", password_confirmation: "password123")
admin = User.create(name: "Admin", email: "admin@example.com", password: "password123", password_confirmation: "password123", admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@testuser.com"
  password = "password123"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end

users = User.all
users.each do |user|
  debit_count = Faker::Number.within(range: 11..90)

  debit_count.times do |n|
    amt = Faker::Number.decimal(l_digits: 2)
    rmk = Faker::ChuckNorris.fact
    # Debit.create!(frequency: "One time", currency: "USD", remarks: rmk, amount: amt, user_id: user.id)
    user.debits.create!(frequency: "One time", currency: "USD", remarks: rmk, amount: amt)
  end
end

Category.create(name: "Bills", system: true)
Category.create(name: "Entertainment", system: true)
Category.create(name: "Food/Drink", system: true)
Category.create(name: "Travel", system: true)