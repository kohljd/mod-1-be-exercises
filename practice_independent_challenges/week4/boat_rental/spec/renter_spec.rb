require "./spec/spec_helper"

RSpec.describe Renter do
    before(:each) do
        @renter = Renter.new("Patrick Star", "4242424242424242")
    end
    
    it "is a Renter object" do
        expect(@renter).to be_an_instance_of(Renter)
    end

    it "gives renter's details" do
        expect(@renter.name).to eq("Patrick Star")
        expect(@renter.credit_card_number).to eq("4242424242424242")
    end
end