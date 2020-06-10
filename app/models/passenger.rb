class Passenger < ApplicationRecord
  has_and_belongs_to_many :bookings, join_table: "bookings_passengers"
  has_many :flights, through: :bookings
end
