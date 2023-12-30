class Groomer
    attr_reader :groomer_name,
                :customer_list,
                :appointments

    def initialize(groomer_name)
        @groomer_name = groomer_name
        @customer_list = []
        @service_fees = {
            "nail trim" => 10,
            "hair cut" => 15,
            "bath" => 20 
        }
        @appointments = []
    end

    def add_customer(customer)
        @customer_list << customer
    end

    def owing_customers
        @customer_list.select {|customer| customer.outstanding_balance > 0}
    end
 
    def total_pet_type(pet_type)
        pet_list = @customer_list.flat_map {|customer| customer.pets}
        pet_list.count {|pet| pet.type == pet_type}
    end

    def appointment(customer_name, pet_name, service_performed)
        customer = @customer_list.find{|customer| customer.name == customer_name}
        service_charge = @service_fees.fetch(service_performed)
        customer.charge(service_charge)
        @appointments << appointment_details= {customer_name: customer_name, service_charge: service_charge, pet_name: pet_name, service_performed: service_performed}
    end
end
