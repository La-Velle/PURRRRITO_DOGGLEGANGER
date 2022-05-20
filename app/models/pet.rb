class Pet < ApplicationRecord
  # belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_location,
  # against: [ :name],
  # using: {
  #   tsearch: { prefix: true }
  # }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
