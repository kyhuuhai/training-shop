User.create!(name: "Admin User",
             email: "admin@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             is_admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  code = "#{n + 1}"
  price = "#{(n + 1) * 100}"
  description = Faker::Lorem.sentence(5)
  if n % 2 == 1
    category = "1"
  else
    category = "2"
  end
  Product.create!(name: name,
                  code: code,
                  price: price,
                  description: description,
                  category_ids: category)
end

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
