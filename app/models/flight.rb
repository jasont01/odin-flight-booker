class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport", foreign_key: "origin"
  belongs_to :to_airport, class_name: "Airport", foreign_key: "dest"
  has_many :bookings
  has_many :passengers, through: :bookings

  def depature_time
    format_time(date, from_airport.timezone)
  end

  def arrival_time
    # Arrival Time - add flight duration(in seconds) to depature time
    format_time(date + (duration * 60), to_airport.timezone)
  end
  
  def flight_time
    "#{(duration - (duration % 60)) / 60} hrs #{duration % 60} mins"
  end

  def flight_date_formatted
    date.strftime("%Y-%m-%d")
  end

  def flight_date_formatted_dropdown
    date.strftime("%m/%d/%Y")
  end

  private

  def format_time(time, timezone)
    time.in_time_zone(timezone).strftime("%a, %d %b %Y %I:%M %p")
  end

end
