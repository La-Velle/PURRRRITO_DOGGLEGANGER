class Booking < ApplicationRecord
  belongs_to :pet_id
  # belongs_to :user_id
  validates :user_id, uniqueness
end
