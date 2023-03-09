puts "starting seed..."

puts "cleaning  database..."
Pet.destroy_all
Family.destroy_all
User.destroy_all

puts "Creating families..."

family = Family.create!(name: "Le Wagon")
family_url = "https://res.cloudinary.com/doohtp0fi/image/upload/v1678309448/pet_family_avatar_k9cdjp.jpg"
family.photo.attach(io: URI.open(family_url), filename: "pet_family_avatar.jpg", content_type: "image/jpg")

puts "Creating users..."

araceli = User.create!(name: "Araceli", email: "araceli@teste.com", password: "123123", family_id: family.id)
araceli_url = "https://res.cloudinary.com/doohtp0fi/image/upload/v1678309448/araceli_avatar_xfmxpb.jpg"
araceli.photo.attach(io: URI.open(araceli_url), filename: "araceli.jpg", content_type: "image/jpg")

otavio = User.create!(name: "Otavio", email: "otavio@teste.com", password: "123123", family_id: family.id)
otavio_url = "https://res.cloudinary.com/doohtp0fi/image/upload/v1678309448/otavio_avatar_qvllay.jpg"
otavio.photo.attach(io: URI.open(otavio_url), filename: "otavio.jpg", content_type: "image/jpg")

vitor = User.create!(name: "Vitor", email: "vitor@teste.com", password: "123123", family_id: family.id)
vitor_url = "https://res.cloudinary.com/doohtp0fi/image/upload/v1678309448/vitor_avatar_ipfty1.jpg"
vitor.photo.attach(io: URI.open(vitor_url), filename: "vitor.jpg", content_type: "image/jpg")

bruno = User.create!(name: "Bruno", email: "bruno@teste.com", password: "123123", family_id: family.id)
bruno_url = "https://res.cloudinary.com/doohtp0fi/image/upload/v1678309448/bruno_avatar_hb6epb.jpg"
bruno.photo.attach(io: URI.open(bruno_url), filename: "bruno.jpg", content_type: "image/jpg")

puts "Creating pets..."

5.times do
  pet = Pet.new(
  name: Faker::Name.name,
  species: Pet::SPECIES.sample,
  birthday: Faker::Date.between(from: 25.years.ago, to: Date.today),
  family_id: family.id
)
  pet.photo.attach(io: URI.open("https://res.cloudinary.com/doohtp0fi/image/upload/v1677870629/samples/animals/three-dogs.jpg"), filename: "gos.jpg", content_type: "image/jpg")
  pet.save
end

puts "#{Family.count} families, #{User.count} users and #{Pet.count} pets created!"
