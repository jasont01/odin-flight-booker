class FlightsController < ApplicationController

  def index

    @airport_options = Airport.all.map { |a| [ a.code, a.id ] }
    @num_tickets_options = 4.times.map { |i| [ i+1 ] }
    @flight_dates = Flight.find_by_sql("SELECT DISTINCT date(departure_date) AS departure_date FROM flights ORDER BY departure_date ASC")
    
    if params[:origin].nil?
      @flights = Flight.all
    else
      @results = Flight.where("origin_id = ? AND destination_id = ? AND departure_date LIKE ?", params[:origin], params[:destination], "#{params[:departure_date]}%")
    end

  end

end
