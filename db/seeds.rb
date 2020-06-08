# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative 'airports'
require_relative 'flight_time'

# Reset database (NOT FOR PRODUCTION)
Airport.delete_all
Flight.delete_all

# Seed Airports
airports.each do |airport|
  Airport.create(code: airport[:code],
                name: airport[:name],
                city: airport[:city],
                state: airport[:state],
                latitude: airport[:coord][0],
                longitude: airport[:coord][1])
end

# Seed Flights
Airport.all.each do |origin|
  Airport.all.each do |destination|
    3.times do 
      next if origin == destination
      duration = flight_time([origin[:latitude], origin[:longitude]], [destination[:latitude], destination[:longitude]])
      date = Time.now + rand(10000000)
      Flight.create(origin: origin.id, dest: destination.id, date: date, duration: duration)
    end
  end
end