class Dock
    attr_reader :name,
                :max_rental_time,
                :rental_log

    def initialize(name, max_rental_time)
        @name = name
        @max_rental_time = max_rental_time
        @rental_log = {}
    end

    def rent(boat, renter)
        @rental_log.store(boat, renter)
    end

    def charge(boat)
        charge_details = {}

        @rental_log.find do |boat_element| 
            boat_element == boat
            boat_element.find do |boat_details|
                if boat_details.hours_rented > @max_rental_time
                    charge_details[:charge_amount] = boat_details.hourly_price * @max_rental_time
                else
                    charge_details[:charge_amount] = boat_details.hourly_price * boat_details.hours_rented
                end
            end
            charge_details[:card_number] = boat_element.last.credit_card_number
        end
        charge_details
    end
end