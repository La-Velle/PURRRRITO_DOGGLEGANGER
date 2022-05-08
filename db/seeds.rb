# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pets = Pet.create(
  [
  { name: 'Money too tight too mention', jpg_url: ""},
  { name: 'Daisy', jpg_url: ""},
  { name: 'Dargo', jpg_url: ""},
  { name: 'Trexy', jpg_url: ""},
  ]
  )
Character.create(
  name: 'racehorse', pet: pets.first),
  (name: 'cow', pet: pets.second),
  (name: 'dragon', pet: pets.third),
  (name: 'trex', pet: pets.fourth),

  puts "done"
