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

    it "tracks available rental boats" do
        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)
        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313")
        expect(@dock.returned_boats).to eq([])

        @dock.rent(kayak_1, patrick)
        @dock.return(kayak_1)
        expect(@dock.returned_boats).to eq([kayak_1])
    end

    it "adds 1 rental hour to boats being rented" do
        kayak_1 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)

        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313")
        @dock.rent(kayak_1, patrick)
        @dock.rent(sup_1, eugene)

        expect(kayak_1.hours_rented).to eq(0)
        @dock.log_hour
        expect(kayak_1.hours_rented).to eq(1)

        @dock.return(kayak_1)
        @dock.log_hour
        expect(sup_1.hours_rented).to eq(2)
    end

    it "tracks total revenue" do
        kayak_1 = Boat.new(:kayak, 20)
        sup_1 = Boat.new(:standup_paddle_board, 15)

        patrick = Renter.new("Patrick Star", "4242424242424242")
        eugene = Renter.new("Eugene Crabs", "1313131313131313")
        @dock.rent(kayak_1, patrick)
        @dock.rent(sup_1, eugene)
        
        expect(@dock.revenue).to eq(0)

        @dock.log_hour
        @dock.return(kayak_1)
        @dock.log_hour
        expect(@dock.revenue).to eq(20)

        @dock.return(sup_1)
        expect(@dock.revenue).to eq(50)
    end
end