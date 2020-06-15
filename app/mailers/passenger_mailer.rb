class PassengerMailer < ApplicationMailer
  default from: 'confirmation@odin-airlines.com'

  def thank_you_email(passenger = params[:passenger])
    @passenger = passenger
    @flight = @passenger.flights.last
    @ticket_url = url_for(controller: 'passengers', action: 'show', id: @passenger.id, host: 'localhost:3000')
    mail(to: @passenger.email, subject: 'Flight Booking Confirmation' )
  end
end
