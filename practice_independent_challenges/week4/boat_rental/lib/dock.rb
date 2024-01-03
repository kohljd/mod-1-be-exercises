class Dock
    attr_reader :name,
                :max_rental_time,
                :rental_log,
                :returned_boats,
                :revenue


    def initialize(name, max_rental_time)
        @name = name
        @max_rental_time = max_rental_time
        @rental_log = {}
        @returned_boats = []
        @revenue = 0
    end

    def rent(boat, renter)
        @rental_log.store(boat, renter)
        @returned_boats.delete(boat)
    end

    def charge(boat)
        charge_details = {}

        if @rental_log.include?(boat)
                if boat.hours_rented > @max_rental_time
                    charge_details[:charge_amount] = boat.hourly_price * @max_rental_time
                else
                    charge_details[:charge_amount] = boat.hourly_price * boat.hours_rented
                end
            charge_details[:card_number] = @rental_log[boat].credit_card_number
        end
        @revenue += charge_details[:charge_amount]
        charge_details
    end

    def return(boat)
        @returned_boats << boat
        charge(boat)
    end

    def log_hour
        @rental_log.each do |boat, renter|
            unless @returned_boats.include?(boat)
                boat.add_hour
            end
        end
    end
end