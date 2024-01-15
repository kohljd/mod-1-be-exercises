require './spec/spec_helper'

RSpec.describe Activity do
    before(:each) do
         @activity = Activity.new("Brunch")
    end

    it 'exists' do
        expect(@activity).to be_an_instance_of(Activity)
    end

    it 'has a name' do
        expect(@activity.name).to eq("Brunch")
    end

    it 'starts with 0 participants' do
        expect(@activity.participants).to eq({})
    end

    it 'can add participants' do
        @activity.add_participant("Maria", 20)
        expect(@activity.participants).to eq({"Maria" => 20})
    end

    it 'returns total cost' do
        @activity.add_participant("Maria", 20)
        expect(@activity.total_cost).to eq(20)

        @activity.add_participant("Luther", 40)
        expect(@activity.total_cost).to eq(60)
    end

    it 'splits total cost between participants' do
        @activity.add_participant("Maria", 20)
        @activity.add_participant("Luther", 40)
        expect(@activity.split).to eq(30)
    end

    it 'returns amount participants owe' do
        @activity.add_participant("Maria", 20)
        @activity.add_participant("Luther", 40)
        expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
end