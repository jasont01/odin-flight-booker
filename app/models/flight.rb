class Flight < ApplicationRecord
  belongs_to :origin, class_name: "Airport", primary_key: "code"
  belongs_to :destination, class_name: "Airport", primary_key: "code"
  has_many :bookings
  has_many :passengers, through: :bookings

  def depature_time
    format_time(departure_date, origin.timezone)
  end

  def arrival_time
    # Add flight duration(in seconds) to depature time
    format_time(departure_date + (duration * 60), destination.timezone)
  end
  
  def flight_time
    "#{(duration - (duration % 60)) / 60} hrs #{duration % 60} mins"
  end

  def self.valid_dates
    flights = Flight.all.order(departure_date: :asc)
    flights.map { |f| f.departure_date.strftime('%d %b %Y') }.uniq
  end

  private

  def format_time(time, timezone)
    time.in_time_zone(timezone).strftime("%a, %d %b %Y %I:%M %p")
  end

end
