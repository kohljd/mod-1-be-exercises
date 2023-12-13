require './lib/player'
require './lib/team'

RSpec.describe Team do
    before(:each) do
        @team = Team.new("France") 
        @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    end

    it "exists" do
        expect(@team).to be_an_instance_of(Team)
    end

    it "can state the country" do
        expect(@team.country).to eq("France")
    end

    it "can be eliminated" do
        expect(@team.eliminated?).to be false

        @team.eliminated = true
        expect(@team.eliminated?).to be true
    end

    it "adds players to team" do
        expect(@team.players).to eq([])
        
        @team.add_player(@mbappe)
        @team.add_player(@pogba)
        expect(@team.players).to eq([@mbappe, @pogba])
    end

    it "states players by position" do
        @team.add_player(@mbappe)
        @team.add_player(@pogba)
        expect(@team.players_by_position("midfielder")).to eq([@pogba])
        expect(@team.players_by_position("forward")).to eq([@mbappe])

        expect(@team.players_by_position("defender")).to eq([@mbappe])
    end
end