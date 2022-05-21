class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  #  in future: has_many :reviews, dependent: :destroy

  validates :start_date, uniqueness: true, presence: true
  validates :end_date, uniqueness: true, presence: true

  validate :end_after_start
  validate :date_cannot_predate

  private

  def end_after_start
    return "must be after the start date" unless end_date < start_date
  end

  def date_cannot_predate
    return "cannot pre-date today" unless start_date < Date.today
  end
end
