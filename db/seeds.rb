30.times {
  Project.create(
    name: Faker::App.name,
    duration: rand(10000),
    description: Faker::FamilyGuy.quote,
    owner: Faker::FamilyGuy.character
  )
}

3.times {
  Cart.create()
}
