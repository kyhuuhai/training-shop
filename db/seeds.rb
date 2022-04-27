User.create!(name: "Admin User",
             email: "admin@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             is_admin: true,
             activated: true,
             activated_at: Time.zone.now)

2.times do |n|
  name = "Category #{n + 1}"
  Category.create!(name: name)
end

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
  random_date = rand(1..20).days
  Product.create!(name: name,
                  code: code,
                  price: price,
                  description: description,
                  category_ids: category,
                  created_at: Time.zone.now + random_date)
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

3.times do |n|
  name = "Payment Method #{n + 1}"
  PaymentMethod.create!(name: name)
end

99.times do |n|
  user_id = rand(1..99)
  payment_method_id = rand(1..3)
  random_date = rand(1..20).days
  Order.create!(user_id: user_id,
                payment_method_id: payment_method_id,
                created_at: Time.zone.now + random_date)
end

99.times do |n|
  product_id = rand(1..99)
  order_id = rand(1..20)
  quantity = rand(1..5)
  price = "#{(n + 1) * 100 * quantity}"
  random_date = rand(1..20).days
  OrderDetail.create!(product_id: product_id,
                      order_id: order_id,
                      quantity: quantity,
                      price: price,
                      created_at: Time.now + random_date)
end
