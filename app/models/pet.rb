class Pet < ApplicationRecord
  belongs_to :user
  # include PgSearch::Model
  # pg_search_scope :search_by_name,
  #   against: [ :name, :description ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }





  has_one_attached :photo

  validates :name, :description, presence: true

  geocoded_by :location
  #after_validation :geocode, if: :will_save_change_to_address?


end
