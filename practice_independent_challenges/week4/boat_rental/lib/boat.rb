class Boat
    attr_reader :type, :hourly_price, :hours_rented

    def initialize (type, hourly_price)
        @type = type
        @hourly_price = hourly_price
        @hours_rented = 0
    end

    def add_hour
        @hours_rented += 1
    end
end