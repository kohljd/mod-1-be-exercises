require './spec2/spec_helper'

RSpec.describe Pet do
    before (:each) do
        @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    end

    it "can initialize" do
        expect(@samson).to be_an_instance_of(Pet)
        expect(@samson.name).to eq("Samson")
        expect(@samson.type).to eq(:dog)
        expect(@samson.age).to eq(3)
    end

    it "can be fed" do
        expect(@samson.fed?).to be false

        @samson.feed
        expect(@samson.fed?).to be true
    end
end