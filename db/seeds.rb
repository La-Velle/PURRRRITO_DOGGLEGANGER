# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning database..."
Pet.destroy_all

puts "Creating pets..."

100.times do
  Pet.create(
    name: Faker::Creature::Dog.name,
    description: Faker::Creature::Dog.breed,
    price: rand(5..10),
    location: Faker::Address.community,
    availability: Faker::Date.between(from: 2.days.ago, to: Date.today)
  )
end

puts "Finished!"
