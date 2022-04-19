99.times do |n|
    name = Faker::Name.name
    code = "#{n+1}"
    price = "#{(n+1)*100}"
    description = Faker::Lorem.sentence(5)
    Product.create!(name: name,
                    code: code,
                    price: price,
                    description: description)
end
99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 activated: true,
                 activated_at: Time.zone.now)
end
