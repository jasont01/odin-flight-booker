class FlightsController < ApplicationController

  def index

    @airport_options = Airport.all.order(:city).map { |a| [ a.city, a.id ] }
    @date_options = Flight.valid_dates
    
    search_flights if params[:commit]
  end

  def search_flights
    if params[:origin] == params[:destination]
      flash.now[:alert] = "Please choose different departure and arrival locations."
    else
      date = Date.parse(params[:departure_date]) if !params[:departure_date].empty?
      @results = Flight.where("origin_id = ? AND destination_id = ? AND departure_date LIKE ?", params[:origin], params[:destination], "#{date}%")
    end
  end

end
