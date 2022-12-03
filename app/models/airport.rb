class Airport < ApplicationRecord
    has_many :departing_flights, class_name: "Flights", foreign_key: "from_airport_id" 
    has_many :arriving_flights, class_name: "Flights", foreign_key: "to_airport_id"
end
