require 'haversine' # Calculates distance between two points given their longitude/latitude

FLIGHTSPEED = 550 / 60.0 # Use average commercial flight speed of 550mph(9.17mpm) to estimate flight time

# Returns flight duration in minutes
def flight_time(origin, destination)

  distance = Haversine.distance(origin, destination)
  distance = distance.to_miles / FLIGHTSPEED
  distance.round
end