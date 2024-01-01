require "./spec/spec_helper"

RSpec.describe Boat do
    before(:each) do
        @kayak = Boat.new(:kayak, 20)
    end
    
    it "is a Boat object" do
        expect(@kayak).to be_an_instance_of(Boat)
    end

    it "give boat details" do
        expect(@kayak.type).to eq(:kayak)
        expect(@kayak.hourly_price).to deq(20)
    end

    it "is rented by the hour" do
        expect(@kayak.hours_rented).to eq(0)

        3.times @kayak.add_hour
        expect(@kayak.hours_rented).to eq(3)
    end
end