30.times {
  Product.create(
    title: Faker::App.name,
    description: Faker::FamilyGuy.quote,
    price: rand(10000),
    image_url: ""
  )
}
