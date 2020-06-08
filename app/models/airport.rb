class Airport < ApplicationRecord
  has_many :flights
  has_many :departing_flights, class_name: "flight", foreign_key: "origin"
  has_many :arriving_flights, class_name: "flight", foreign_key: "dest"
end
