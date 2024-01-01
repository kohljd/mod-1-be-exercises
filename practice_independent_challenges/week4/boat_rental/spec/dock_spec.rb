require "./spec/spec_helper"

RSpec.describe Dock do
    before(:each) do
        @dock = Dock.new("The Rowing Dock", 3)
    end
    
    it "is a Dock object" do
        expect(@dock).to be_an_instance_of(Dock)
    end

    it "gives dock's details" do
        expect(@dock.name).to eq("The Rowing Dock")
        expect(@dock.max_rental_time).to eq(3)
    end

    it "lists renters and their rented boat" do
        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313")

        @dock.rent(kayak_1, patrick)
        @dock.rent(kayak_2, patrick) 
        @dock.rent(sup_1, eugene)
        expect(@dock.rental_log).to eq({kayak_1 => patrick, kayak_2 => patrick, sup_1 => eugene})
    end

    it "charges renter based on boat type" do
        kayak_1 = Boat.new(:kayak, 20)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        @dock.rent(kayak_1, patrick)
        
        expect(@dock.charge(kayak_1)).to eq({:card_number=>"4242424242424242", :charge_amount=>0})

        kayak_1.add_hour
        kayak_1.add_hour
        expect(@dock.charge(kayak_1)).to eq({:card_number=>"4242424242424242", :charge_amount=>40})

        kayak_1.add_hour
        kayak_1.add_hour
        expect(@dock.charge(kayak_1)).to eq({:card_number=>"4242424242424242", :charge_amount=>60})
    end
end