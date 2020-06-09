class FlightsController < ApplicationController

  def index

    @airport_options = Airport.all.map { |a| [ a.code, a.id ] }
    @num_tickets_options = 4.times.map { |i| [ i+1 ] }
    @flight_dates = Flight.find_by_sql("SELECT DISTINCT date(date) AS date FROM flights ORDER BY date ASC")
    
    if params[:origin].nil?
      @flights = Flight.all
    else
      @flights = Flight.where("origin = ? AND dest = ? AND date LIKE ?", params[:origin], params[:dest], "#{params[:date]}%")
    end

  end

end
