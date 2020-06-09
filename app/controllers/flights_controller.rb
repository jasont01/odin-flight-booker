class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    @airport_options = Airport.all.map { |a| [ a.code, a.id ] }
    @num_passengers_options = 4.times.map { |i| [ "#{i+1}",i+1 ] }
    @flight_dates = Flight.find_by_sql("SELECT DISTINCT date(date) AS date FROM flights ORDER BY date ASC")
  end
  
end
