
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