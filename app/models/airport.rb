class Airport < ApplicationRecord
  has_many :departing_flights, class_name: "Flight", foreign_key: "origin"
  has_many :arriving_flights, class_name: "Flight", foreign_key: "dest"
end
