class VetClinic
    attr_reader :vet_name,
                :customer_list

    def initialize(vet_name)
        @vet_name = vet_name
        @customer_list = []
    end

    def add_customer(customer)
        @customer_list << customer
    end

    def customer_pets
        pet_list = @customer_list.flat_map {|customer| customer.pets}
        pet_list.sort_by {|pet| pet.age}
    end

    def pet_count(customer_name)
        customer = @customer_list.find{|customer| customer.name == customer_name}
        customer.pets.count
    end
end