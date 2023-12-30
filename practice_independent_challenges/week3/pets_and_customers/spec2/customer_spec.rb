require "./spec2/spec_helper"

RSpec.describe Customer do
    before(:each) do
        @joel = Customer.new("Joel", 2)
    end

    it "can initialize" do
        expect(@joel).to be_an_instance_of(Customer)
        expect(@joel.name).to eq("Joel")
        expect(@joel.id).to eq(2)
    end

    it "can adopt pets" do
        expect(@joel.pets).to eq([])

        samson = Pet.new({name: "Samson", type: :dog, age: 3})
        lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
        @joel.adopt(samson)
        @joel.adopt(lucy)
        
        expect(@joel.pets).to eq([samson, lucy])
    end

    it "states balance owed" do
        expect(@joel.outstanding_balance).to eq(0)

        @joel.charge(15)
        @joel.charge(7)

        expect(@joel.outstanding_balance).to eq(22)
    end
end