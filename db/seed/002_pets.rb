puts "Cleaning database..."
Pet.destroy_all

puts "Creating pets..."

#   100.times do
#     Pet.create(
#       name: Faker::Creature::Dog.name,
#       description: Faker::Creature::Dog.breed,
#       price: rand(5..10),
#       location: Faker::Address.community,
#       availability: Faker::Date.between(from: 2.days.ago, to: Date.today)
#     )
#   end

puts "Finished!"
