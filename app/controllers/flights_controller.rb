class FlightsController < ApplicationController

  def index

    @airport_options = Airport.all.order(:city).map { |a| [ a.city, a.id ] }
    @date_options = Flight.valid_dates
    
    search_flights if params[:commit]
  end

  def search_flights
    if params[:origin] == params[:destination]
      flash.now[:alert] = "Please choose different departure and arrival cities."
    elsif 
      params[:departure_date].empty?
      @results = Flight.where("origin_id = ? AND destination_id = ?", params[:origin], params[:destination])
    else
      date = Date.parse(params[:departure_date])
      date_begin = date.beginning_of_day
      date_end = date.end_of_day
      @results = Flight.where("origin_id = ? AND destination_id = ? AND departure_date > ? AND departure_date < ?", params[:origin], params[:destination], date_begin, date_end)
    end
  end

end
