class PassengersController < ApplicationController
  def show
    @passenger = Passenger.find_by_id(params[:id])
    @flight = @passenger.flights.last
    @booking = @passenger.booking

    @gate = "#{rand(1..36)}" + ('A'..'D').to_a.sample
    @seat = "#{rand(10..48)}" + ('A'..'F').to_a.sample
  end
end
