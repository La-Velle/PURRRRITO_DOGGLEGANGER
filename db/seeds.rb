# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require "open-uri"

puts "cleaning database"
Pet.destroy_all
puts "cleaning database"
User.destroy_all

userone = User.create!(first_name: "T", last_name: "Lave", email: "lavellesine@gmail.com", password: "123456")
usertwo = User.create!(first_name: "A", last_name: "Godfrey", email: "anna@gmail.com", password: "123456")
userthree = User.create!(first_name: "S", last_name: "Piccolo", email: "simone@gmail.com", password: "123456")

pet_photos = ['https://images.pexels.com/photos/2253275/pexels-photo-2253275.jpeg?cs=srgb&dl=pexels-helena-lopes-2253275.jpg&fm=jpg','https://images.pexels.com/photos/825949/pexels-photo-825949.jpeg?cs=srgb&dl=pexels-gilberto-reyes-825949.jpg&fm=jpg']

pet_photos.each do |photo|

pet = Pet.new(user: userone,
  name: Faker::Creature::Dog.name,
  price: rand(1..5),
  description: Faker::Creature::Dog.meme_phrase)
   file = URI.open(photo)

   pet.photo.attach(io: file, filename: 'photo', content_type: 'image/png')
   puts "check"
  pet.save!
  puts "after"
end
pet_photos_two = ['https://images.pexels.com/photos/3009441/pexels-photo-3009441.jpeg?cs=srgb&dl=pexels-josh-hild-3009441.jpg&fm=jpgs','https://images.pexels.com/photos/2248516/pexels-photo-2248516.jpeg?cs=srgb&dl=pexels-andrew-neel-2248516.jpg&fm=jpg']

pet_photos_two.each  do |photo|

pet_one = Pet.new(user: usertwo,
  name: Faker::Creature::Dog.name,
  price: rand(1..5),
  description: Faker::Creature::Dog.meme_phrase)
   file = URI.open(photo)

   pet_one.photo.attach(io: file, filename: 'photo', content_type: 'image/png')
   puts "check"
   pet_one.save!
  puts "after"
end
pet_photos_three = ['https://images.pexels.com/photos/1849974/pexels-photo-1849974.jpeg?cs=srgb&dl=pexels-lisa-fotios-1849974.jpg&fm=jpg','https://images.pexels.com/photos/4587971/pexels-photo-4587971.jpeg?cs=srgb&dl=pexels-anna-shvets-4587971.jpg&fm=jpg']

pet_photos_three.each  do |photo|

  pet_two = Pet.new(user: userthree,
  name: Faker::Creature::Dog.name,
  price: rand(1..5),
  description: Faker::Creature::Dog.meme_phrase)
   file = URI.open(photo)

   pet_two.photo.attach(io: file, filename: 'photo', content_type: 'image/png')
   puts "check"
   pet_two.save!
  puts "after"


end
puts "Finished!"
