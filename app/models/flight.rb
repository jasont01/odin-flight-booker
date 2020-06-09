class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport", foreign_key: "origin"
  belongs_to :to_airport, class_name: "Airport", foreign_key: "dest"

  def flight_date_formatted
    date.strftime("%m/%d/%Y")
  end
end
