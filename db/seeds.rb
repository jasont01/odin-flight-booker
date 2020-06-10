require_relative 'airports'
require_relative 'flight_time'

# Reset database (NOT FOR PRODUCTION)
Airport.delete_all
Flight.delete_all

# Seed Airports
AIRPORTS.each do |airport|
  Airport.create(code: airport[:code],
                name: airport[:name],
                city: airport[:city],
                state: airport[:state],
                latitude: airport[:coord][0],
                longitude: airport[:coord][1],
                timezone: airport[:timezone])
end

# Seed Flights
Airport.all.each do |origin|
  Airport.all.each do |destination|
    3.times do 
      next if origin == destination
      duration = flight_time([origin[:latitude], origin[:longitude]], [destination[:latitude], destination[:longitude]])
      date = Time.now + rand(10000000)
      Flight.create(flight_num: rand(1000..9999), origin_id: origin.id, destination_id: destination.id, date: date, description: "#{origin.code} to #{destination.code}, #{date}", duration: duration)
    end
  end
end