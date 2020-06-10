class BookingsController < ApplicationController

  def new
    @flight = Flight.find_by_id(params[:flight])
    @booking = Booking.new(:flight_id => @flight.id)

    @num_passengers = params[:passengers].to_i
    @num_passengers.times { @booking.passengers.build }
  end
  
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = "Booking Confirmed"
      redirect_to @booking
    else
      flash.now[:alert] = "Something went wrong."
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:first_name, :last_name, :email])
  end

end
