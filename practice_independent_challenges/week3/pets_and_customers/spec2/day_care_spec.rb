require "./spec2/spec_helper"

RSpec.describe DayCare do
    before(:each) do
        @day_care_1 = DayCare.new("Pawsome Care")
        @joel = Customer.new("Joel", 2)
        @maria = Customer.new("Maria", 3)
        
        @samson = Pet.new({name: "Samson", type: :dog, age: 3})
        @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
        @joel.adopt(@samson)
        @joel.adopt(@lucy)
    end

    it "can initialize" do
        expect(@day_care_1).to be_an_instance_of(DayCare)
        expect(@day_care_1.day_care_name).to eq("Pawsome Care")
    end

    it "lists customers' and their pets data" do
        expect(@day_care_1.customers).to eq([])

        @day_care_1.add_customer(@joel)
        expect(@day_care_1.customers).to eq([@joel])
        expect(@day_care_1.customer_pets).to eq([@samson, @lucy])
    end

    it "finds customer by id" do
        @day_care_1.add_customer(@joel)
        expect(@day_care_1.id_customer(2)).to eq([@joel])
    end

    it "lists unfed pets" do
        expect(@day_care_1.unfed_pets).to eq([])

        @day_care_1.add_customer(@joel)
        expect(@day_care_1.unfed_pets).to eq([@samson, @lucy])

        @samson.feed
        expect(@day_care_1.unfed_pets).to eq([@lucy])
    end

    it "feeds all unfed pets" do
        @day_care_1.add_customer(@joel)
        expect(@day_care_1.unfed_pets).to eq([@samson, @lucy])
        @day_care_1.day_care_feed_unfed_pets
        expect(@day_care_1.unfed_pets).to eq([])
    end

    it "charges customers to feed pets" do
        @day_care_1.add_customer(@joel)
        expect(@day_care_1.unfed_pets).to eq([@samson, @lucy])
        @day_care_1.day_care_feed_unfed_pets
        expect(@joel.outstanding_balance).to eq(30)
    end
end