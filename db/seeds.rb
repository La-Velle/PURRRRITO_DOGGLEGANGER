# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

# puts "Cleaning database..."
# Pet.destroy_all

# puts "Creating pets..."

# 3.times do
#   Pet.create(
#     name: Faker::Creature::Dog.name,
#     description: Faker::Creature::Dog.breed,
#     price: rand(5..10),
#     location: Faker::Address.community,
#     availability: Faker::Date.rand
#   )
#end



  # Pet.create!(
  #   name: "Rocky",
  #   description: "pointer",
  #   price: 50 ,
  #   location: "wood green",
  #   availability: Date.tomorrow,
  #   user: User.all.sample  )

  # Pet.create!(
  #   name: "Thor",
  #   description: "Setter",
  #   price: 50 ,
  #   location: "wood green",
  #   availability: Date.tomorrow,
  #   user: User.all.sample  )

  #   puts "Finished!"

# Game.create!(name: "Tekken 3 - PSOne",
#   category: category[rand(0..3)],
#   description: "Great game, still works perfect.",
#   location: "-914 Manor Road, London, SE79 8LK",
#   price_per_day: 5,
#   user: User.all.sample)
# puts "Finished!"
puts "cleaning database"
Pet.destroy_all
puts "cleaning database"
User.destroy_all

userone = User.create!(first_name: "T", last_name: "Lave", email: "lavellesine@gmail.com", password: "123456")
usertwo = User.create!(first_name: "A", last_name: "Godfrey", email: "anna@gmail.com", password: "123456")
userthree = User.create!(first_name: "S", last_name: "Piccolo", email: "simone@gmail.com", password: "123456")


10.times do
  Pet.create!(user: userone, name: Faker::Creature::Animal.name, description: Faker::Creature::Bird.emotional_adjective)
end
10.times do
  Pet.create!(user: usertwo, name: Faker::Creature::Animal.name, description: Faker::Creature::Bird.emotional_adjective)
end
25.times do
  Pet.create!(user: userthree, name: Faker::Creature::Animal.name, description: Faker::Creature::Bird.emotional_adjective)
end
puts "Finished!"
