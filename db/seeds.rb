puts "starting seed..."

puts "cleaning  database..."
Pet.destroy_all
Family.destroy_all
User.destroy_all

puts "Creating families..."

family = Family.create!(name: "Le Wagon")

puts "Creating users..."

araceli = User.create!(name: "Araceli", email: "araceli@teste.com", password: "123123", family_id: family.id)
otavio = User.create!(name: "Otavio",email: "otavio@teste.com", password: "123123", family_id: family.id)
vitor = User.create!(name: "Vitor", email: "vitor@teste.com", password: "123123", family_id: family.id)
bruno = User.create!(name: "Bruno", email: "bruno@teste.com", password: "123123", family_id: family.id)

puts "Creating pets..."

5.times do
  Pet.create(
    name: Faker::Name.name,
    species: Pet::SPECIES.sample,
    birthday: Faker::Date.between(from: 25.years.ago, to: Date.today),
    family_id: family.id
  )
end

puts "#{Family.count} families, #{User.count} users and #{Pet.count} pets created!"
