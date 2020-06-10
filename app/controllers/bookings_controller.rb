class BookingsController < ApplicationController

  def new
    @num_passengers = params[:tickets] || 2
    @booking = Booking.new(:flight_id => params[:flight])
    @booking.passengers.new
  end
  
  def create
    redirect_to @booking
  end

  def show
    @booking = Booking.last #testing
    
    #@depature_time = @booking.flight.date.in_time_zone(@booking.flight.from_airport.timezone).strftime("%a, %d %b %Y %I:%M %p")
    @depature_time = format_time(@booking.flight.date, @booking.flight.from_airport.timezone)
    
    # Arrival Time - add flight duration(in seconds) to depature time
    @arrival_time = @booking.flight.date + (@booking.flight.duration * 60)
    #@arrival_time = @arrival_time.in_time_zone(@booking.flight.to_airport.timezone).strftime("%a, %d %b %Y %I:%M %p")

    @arrival_time = format_time(@arrival_time, @booking.flight.to_airport.timezone)
    
    #@flight_time_mins = @booking.flight.duration % 60
    #@flight_time_hrs = (@booking.flight.duration - @flight_time_mins) / 60
    @flight_time = "#{(@booking.flight.duration - (@booking.flight.duration % 60)) / 60} hrs #{@booking.flight.duration % 60} mins"
  end

  def format_time(time, timezone)
    time.in_time_zone(timezone).strftime("%a, %d %b %Y %I:%M %p")
  end
end
