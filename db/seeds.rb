require_relative 'airports'
require_relative 'flight_time'

# Seed Airports
AIRPORTS.each do |airport|
  Airport.create(code: airport[:code],
                name: airport[:name],
                city: airport[:city],
                country: airport[:country],
                latitude: airport[:latitude],
                longitude: airport[:longitude],
                timezone: airport[:timezone])
end

# Seed Flights
Airport.all.each do |origin|
  Airport.all.each do |destination|
    rand(1..5).times do 
      next if origin == destination
      
      date = Time.now + rand(10000000)
      duration = flight_time([origin[:latitude], origin[:longitude]], [destination[:latitude], destination[:longitude]])
      description = "#{origin.city} to #{destination.city}"

      Flight.create(flight_num: rand(1000..9999),
                    origin_id: origin.id,
                    destination_id: destination.id,
                    departure_date: date,
                    description: description,
                    duration: duration)
    end
  end
end