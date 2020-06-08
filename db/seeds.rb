# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Airports
Airport.delete_all
Flight.delete_all

airports = [
  { code: "FLL", 
    name: "Fort lauderdale-Hollywood International Airpot",
    city: "Fort Lauderdale",
    state: "FL" },
  { code: "ATL", 
    name: "Hartsfield–Jackson Atlanta International Airport",
    city: "Atlanta",
    state: "GA" },
  { code: "LAX", 
    name: "Los Angeles International Airport",
    city: "Los Angeles",
    state: "CA" },
  { code: "ORD", 
    name: "O'Hare International Airport",
    city: "Chicago",
    state: "IL" },
  { code: "DFW", 
    name: "Dallas/Fort Worth International Airport",
    city: "Dallas",
    state: "TX" },
  { code: "SFO", 
    name: "San Francisco International Airport",
    city: "San Francisco",
    state: "CA" },
  { code: "CLT", 
    name: "Charlotte Douglas International Airport",
    city: "Charlotte",
    state: "NC" },
  { code: "JFK", 
    name: "John F. Kennedy International Airport",
    city: "New York",
    state: "NY" }
]

airports.each do |airport|
  Airport.create(code: airport[:code],
                name: airport[:name],
                city: airport[:city],
                state: airport[:state])
end