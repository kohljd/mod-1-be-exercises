require "./spec2/spec_helper"

RSpec.describe Groomer do
    before(:each) do
        @groomer = Groomer.new("Fred")

        @joel = Customer.new("Joel", 2)
        @maria = Customer.new("Maria", 3)
        
        @samson = Pet.new({name: "Samson", type: :dog, age: 3})
        @max = Pet.new({name: "Max", type: :dog, age: 4})
        @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
        @taco = Pet.new({name: "Taco Cat", type: :cat, age: 10})

        @joel.adopt(@samson)
        @joel.adopt(@max)
        @maria.adopt(@lucy)
        @maria.adopt(@taco)
    end

    it "can initialize" do
        expect(@groomer).to be_an_instance_of(Groomer)
        expect(@groomer.groomer_name).to eq("Fred")
        expect(@groomer.customer_list).to eq([])
    end

    describe "groomer's customers" do
        before(:each) do
            @groomer.add_customer(@joel)
            @groomer.add_customer(@maria)
        end

        it "can gain customers" do
            expect(@groomer.customer_list).to eq([@joel, @maria])
        end

        it "lits customers with outstanding balances" do
            expect(@groomer.owing_customers).to eq([])

            @joel.charge(10)
            @maria.charge(22)
            expect(@groomer.owing_customers).to eq([@joel, @maria])
        end

        it "counts customers' pets of a given type" do
            expect(@groomer.total_pet_type(:dog)).to eq(2)
            expect(@groomer.total_pet_type(:cat)).to eq(2)
        end
    end

    describe "service charges" do
        before(:each) do
            @groomer.add_customer(@joel)
            @groomer.add_customer(@maria)
        end

        it "charges customers based on service" do
            @groomer.appointment("Joel", "Samson", "hair cut")
            expect(@joel.outstanding_balance).to eq(15)

            @groomer.appointment("Joel", "Max", "bath")
            @groomer.appointment("Maria", "Lucy", "nail trim")
            @groomer.appointment("Maria", "Taco", "nail trim")
            expect(@joel.outstanding_balance).to eq(35)
            expect(@maria.outstanding_balance).to eq(20)
        end

        it "can state an appointment's charge details" do
            @groomer.appointment("Joel", "Samson", "hair cut")
            @groomer.appointment("Joel", "Max", "bath")

            expect(@groomer.appointments.first[:customer_name]).to eq("Joel")
            expect(@groomer.appointments.first[:pet_name]).to eq("Samson")
            expect(@groomer.appointments.first[:service_performed]).to eq("hair cut")
            expect(@groomer.appointments.first[:service_charge]).to eq(15)

            expect(@groomer.appointments.last[:pet_name]).to eq("Max")
            expect(@groomer.appointments.last[:service_performed]).to eq("bath")
            expect(@groomer.appointments.last[:service_charge]).to eq(20)
        end
    end
end
