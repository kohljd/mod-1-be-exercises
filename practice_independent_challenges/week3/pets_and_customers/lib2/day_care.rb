class DayCare
    attr_reader :day_care_name,
                :customers

    def initialize(day_care_name)
        @day_care_name = day_care_name
        @customers = []
        @feed_charge = {
            cat: 10,
            dog: 20,
            bird: 15
        }
    end

    def add_customer(customer)
        @customers << customer
    end

    def customer_pets
        @customers.flat_map {|customer| customer.pets}
    end

    def id_customer(customer_id)
        @customers.select {|customer| customer.id == customer_id}
    end

    def unfed_pets
        customer_pets.select {|pet| pet.fed? == false}
    end

    def day_care_feed_unfed_pets
        for customer in @customers
            for customer_pet in customer.pets
                unless customer_pet.fed?
                    customer.charge(@feed_charge.fetch(customer_pet.type))
                    customer_pet.feed
                end
            end
        end
    end
end
