require './lib/player'
require './lib/team'
require './lib/world_cup'

RSpec.describe WorldCup do
    before(:each) do
        @france = Team.new("France") 
        @croatia = Team.new("Croatia")
        
        @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
        @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
        @modric = Player.new({name: "Luka Modric", position: "midfielder"})
        @vida = Player.new({name: "Domagoj Vida", position: "defender"})

        @france.add_player(@mbappe)
        @france.add_player(@pogba)
        @croatia.add_player(@modric)
        @croatia.add_player(@vida)

        @world_cup = WorldCup.new(2018, [@france, @croatia])
    end

    it "exists" do
        expect(@world_cup).to be_an_instance_of(WorldCup)
    end

    it "lists attributes" do
        expect(@world_cup.year).to eq(2018)
        expect(@world_cup.teams).to eq([@france, @croatia])
    end

    it "lists players' positions from noneliminated teams" do
        expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba, @modric])
    end

    it "lists all players by position" do
        expect(@world_cup.all_players_by_position).to eq({"forward" => [@mbappe], "defender" => [@vida], "midfielder" => [@pogba, @modric]})
    end
end