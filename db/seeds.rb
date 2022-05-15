# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require "open-uri"

file = URI.open('https://en.wikipedia.org/wiki/Setter#/media/File:English_setter.jpg')

puts "cleaning database"
Pet.destroy_all
puts "cleaning database"
User.destroy_all




userone = User.create!(first_name: "T", last_name: "Lave", email: "lavellesine@gmail.com", password: "123456")
usertwo = User.create!(first_name: "A", last_name: "Godfrey", email: "anna@gmail.com", password: "123456")
userthree = User.create!(first_name: "S", last_name: "Piccolo", email: "simone@gmail.com", password: "123456")

@pet = Pet.new(user: userthree, name: Faker::Creature::Animal.name, description: Faker::Creature::Bird.emotional_adjective)
@pet.save
@pet.photo.attach(io: file, filename: "photo")


5.times do
  Pet.new(user: userone, name: Faker::Creature::Animal.name, description: Faker::Creature::Bird.emotional_adjective)

end
2.times do
  Pet.create!(user: usertwo, name: Faker::Creature::Animal.name, description: Faker::Creature::Bird.emotional_adjective)
end
3.times do
  Pet.create!(user: userthree, name: Faker::Creature::Animal.name, description: Faker::Creature::Bird.emotional_adjective)
end
puts "Finished!"
