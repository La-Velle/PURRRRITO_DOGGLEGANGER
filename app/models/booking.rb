class Booking < ApplicationRecord
  belongs_to :pet_id
  # belongs_to :user_id
  validates :user_id, uniqueness
end


# needs to be added ? to use simple calender gem
name:string
start_time:datetime presence:true
end_time:datetime presence:true
user:references
# By default the gem looks for a start_time attribute to display the events,
# so make sure your model uses this name too.
