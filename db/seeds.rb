puts "starting seed..."

puts "cleaning  database..."
Task.destroy_all
Pet.destroy_all
Family.destroy_all
User.destroy_all
Species.destroy_all
Breed.destroy_all

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

puts "----------------------------------------------"
puts "Creating species..."

dog = Species.create!(name: "Cachorro")
horse = Species.create!(name: "Cavalo")
cat = Species.create!(name: "Gato")
bird = Species.create!(name: "Pássaro")
reptile = Species.create!(name: "Réptil")

puts "Creating breeds.."

dog_breeds = ["Border Collie", "Bulldog", "Dachshund", "Golden Retriever", "Labrador", "Lhasa Apso", "Maltês", "Pinscher", "Poodle", "Pug", "Rottweiler", "Shih Tzu", "Spitz Alemão", "Vira lata(SRD)", "Yorkshire", "Outros"]
horse_breeds = ["Andaluz", "Árabe", "Campeiro", "Campolina", "Crioulo", "Manga-larga", "Mangalarga Marchador", "Pampa", "Quarto de Milha"]
cat_breeds = ["American Shorthair", "Angorá", "Ashera", "Exótico", "Himalaia", "Maine Coon", "Persa", "Ragdoll", "Siamês", "Sphynx", "Vira Lata (SDR)"]
bird_breeds = ["Bem-te-vi", "Bicudo", "Cacatua", "Calopsitas", "Canário da Terra", "Coleira", "Curió", "Ganso", "Papagaio", "Pardal", "Pavão", "Periquito", "Sabiá", "Trinca Ferro"]
reptile_breeds = ["Cágado", "Dragão-barbudo", "Iguana", "Jabuti", "Jiboia", "Lagartixa", "Lagarto Teiú", "Suaçuboia", "Tartaruga"]

bird_breeds.each do |breed|
  Breed.create!(name: breed, species_id: bird.id)
end

cat_breeds.each do |breed|
  Breed.create!(name: breed, species_id: cat.id)
end

dog_breeds.each do |breed|
  Breed.create!(name: breed, species_id: dog.id)
end

horse_breeds.each do |breed|
  Breed.create!(name: breed, species_id: horse.id)
end

reptile_breeds.each do |breed|
  Breed.create!(name: breed, species_id: reptile.id)
end

puts "Creating pets..."

bird_pet = Pet.create!(name: "Angry Bird", birthday: Faker::Date.birthday(min_age: 1, max_age: 32), family_id: family.id, breed: Breed.where(species_id: bird.id).sample)
bird_pet.photo.attach(io: URI.open("https://res.cloudinary.com/doohtp0fi/image/upload/v1678395430/angry_birds_dhkoum.jpg"), filename: "gos.jpg", content_type: "image/jpg")

cat_pet = Pet.create!(name: "Deeze Cat", birthday: Faker::Date.birthday(min_age: 1, max_age: 32), family_id: family.id, breed: Breed.where(species_id: cat.id).sample)
cat_pet.photo.attach(io: URI.open("https://res.cloudinary.com/doohtp0fi/image/upload/v1678395215/deeze_cat_r0ncym.jpg"), filename: "gos.jpg", content_type: "image/jpg")

dog_pet = Pet.create!(name: "Van Dog", birthday: Faker::Date.birthday(min_age: 1, max_age: 32), family_id: family.id, breed: Breed.where(species_id: dog.id).sample)
dog_pet.photo.attach(io: URI.open("https://res.cloudinary.com/doohtp0fi/image/upload/v1678395215/van_dog_ex38er.jpg"), filename: "gos.jpg", content_type: "image/jpg")

horse_pet = Pet.create!(name: "Go Horse", birthday: Faker::Date.birthday(min_age: 1, max_age: 32), family_id: family.id, breed: Breed.where(species_id: horse.id).sample)
horse_pet.photo.attach(io: URI.open("https://res.cloudinary.com/doohtp0fi/image/upload/v1678395430/go_horse_cwxsv0.jpg"), filename: "gos.jpg", content_type: "image/jpg")

reptile_pet = Pet.create!(name: "Smoking Snake", birthday: Faker::Date.birthday(min_age: 1, max_age: 32), family_id: family.id, breed: Breed.where(species_id: reptile.id).sample)
reptile_pet.photo.attach(io: URI.open("https://res.cloudinary.com/doohtp0fi/image/upload/v1678395214/smoking_snake_txdfoy.jpg"), filename: "gos.jpg", content_type: "image/jpg")

puts "#{Family.count} families, #{User.count} users and #{Pet.count} pets created!"
