class BookingsController < ApplicationController
    include BookingHelper

    def new
        @booking = Booking.new
        @selected_flight = Flight.find(params[:flight])
        @passenger_count = params[:pax].to_i
        @passenger_count.times { @booking.passengers.build }
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            flash[:notice] = "Booking successful!"
            #@booking.passengers.each do |passenger|
            #    PassengerMailer.confirmation_email(passenger).deliver.now
            #end
            redirect_to booking_path(@booking)
        else
            flash[:alert] = 'An error occured'
            render :new
        end
    end

    def show
        @booking = Booking.find(params[:id])
    end
end
