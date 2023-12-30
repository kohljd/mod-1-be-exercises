require "./spec2/spec_helper"

RSpec.describe VetClinic do
    before(:each) do
        @vet = VetClinic.new("Amanda")

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
        expect(@vet).to be_an_instance_of(VetClinic)
        expect(@vet.vet_name).to eq("Amanda")
        expect(@vet.customer_list).to eq([])
    end

    describe "vet's customers and pets" do
        before(:each) do
            @vet.add_customer(@joel)
            @vet.add_customer(@maria)
        end

        it "can gain customers" do
            expect(@vet.customer_list).to eq([@joel, @maria])
        end

        it "can list customers' pets by age" do
            expect(@vet.customer_pets).to eq([@samson, @max, @taco, @lucy])
        end

        it "can count a customer's pets" do
            expect(@vet.pet_count("Joel")).to eq(2)
        end
    end
end
