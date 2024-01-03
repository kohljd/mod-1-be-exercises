require "./spec/spec_helper"

RSpec.describe Contestant do
    before(:each) do
        @alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
    end

    it "is an object" do
        expect(@alexander).to be_an_instance_of(Contestant)
    end

    it "has attributes" do
        expect(@alexander.full_name).to eq("Alexander Aigiades")
        expect(@alexander.age).to eq(28)
        expect(@alexander.state_of_residence).to eq("CO")
        expect(@alexander.spending_money).to eq(10)
        expect(@alexander.game_interests).to eq([])
    end

    it "can have added game interests" do
        @alexander.add_game_interest('Mega Millions')
        @alexander.add_game_interest('Pick 4')
        
        expect(@alexander.game_interests).to eq(["Mega Millions", "Pick 4"])
    end

    it "tells if from out of state" do
        expect(@alexander.out_of_state?).to be false

        george = Contestant.new({state_of_residence: 'MN'})
        expect(george.out_of_state).to be true
    end
end