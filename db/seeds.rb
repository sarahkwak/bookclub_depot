30.times {
  Product.create(
    title: Faker::FamilyGuy.character,
    price: rand(1000).to_i,
    description: Faker::FamilyGuy.quote,
    image_url: Faker::Avatar.image("my-own-slug", "50x50", "bmp")
  )
}
