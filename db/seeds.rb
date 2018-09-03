30.times {
  Project.create(
    name: Faker::App.name,
    duration: rand(100),
    description: Faker::FamilyGuy.quote,
    owner: Faker::FamilyGuy.character
  )
}
