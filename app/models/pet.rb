class Pet < ApplicationRecord
  belongs_to :user

  validates :name, :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?

end
