class Team
    attr_reader :country,
                :players

    attr_accessor :eliminated
    
    def initialize(country)
        @country = country
        @eliminated = false
        @players = []
    end

    def eliminated?
        @eliminated
    end

    def add_player(player)
        @players << player
    end

    def players_by_position(position_name)
        @players.select {|player| player.position == position_name}
    end
end