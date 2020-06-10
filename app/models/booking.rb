class Booking < ApplicationRecord
  belongs_to :flight
  has_and_belongs_to_many :passengers, join_table: "bookings_passengers"

end
