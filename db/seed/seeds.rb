# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
  puts "Processing #{file.split('/').last}"
  require file
end
#         ***Done as explained above***

# pets = Pet.create([{ name: 'Money to tight to mention' }, { name: 'Daisy' }, { name: 'Dargo' }, { name: 'Trexy' }])
# Character.create(name: 'racehorse', pet: pets.first,
# name: 'daisy', pet: pets.second,
# name: 'dargo', pet: pets.third,
# name: 'trexy', pet:pets.last
# )
#          ***Done as Rails explains***

# puts 'Creating pets ...'
# money_to_tight_to_mention = Pet.new(name: "money to tight to mention")
# money_to_tight_to_mention.save!
# # racehorse

# daisy = Pet.new(name: "Daisy")
# daisy.save!
# # cow

# dargo = Pet.new(name: "Dargo")
# Dargo.save!
# # dragon

# trexy =Pet.new(name: "Trexy")
# trexy.save!
# # T Rex

# puts 'Finished!'

#            ***Done with Faker***

# require 'faker'

# puts 'Creating 100 fake pets...'
# 20.times do
#   pet = Pet.new(
#     pet: Faker::Creature::Animal.name #=> "Antelope"
#     # name and description below ** requested unique name
#     name: "#{Faker::Hipster.words(number: 1).unique.name }, #{Faker::Superhero.descriptor}",
      # description: Faker::Creature::Bird.emotional_adjective #=> "cantankerous"
      # image: Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'animal')
#     # Produces a Float by default
#     # Keyword arguments: range, as_string
#     price: Faker::Commerce.price(range: 0..10.0, as_string: true) #=> "2.18"
#     address: Faker::Address.community #=> "University Crossing"
#     # availability
#     # Random date in the future (up to maximum of N days)
#     # Keyword arguments: days
#     date: Faker::Date.forward(days: 23) # => "Fri, 03 Oct 2014"
#     #  ID No.
#     id: Faker::IDNumber.valid #=> "552-56-3593"
#     # Does this need to be IDNumber:  Faker . . . ?
#   )
#   pet.save!
# end
# puts 'Finished!'

#   Not created bookings in all 3 modes:
# puts 'Creating 50 fake bookings...'
10.times do
  booking = Booking.new(
   # Random date between dates
   # Keyword arguments: from, to
   Faker::Date.between(from: '2014-09-23', to: '2014-09-25') #=> #<Date: 2014-09-24>
  #  Link with PET ID ? Do I need a pet Id faker here ?
  )
end
