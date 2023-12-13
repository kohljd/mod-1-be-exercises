class WorldCup
    attr_reader :year,
                :teams
    
    def initialize(year, teams)
        @year = year
        @teams = teams
    end

    def active_players_by_position(position_name)
        active_teams = @teams.select {|team| team.eliminated? == false}
        active_teams.flat_map {|team| team.players_by_position(position_name)}
    end

    def all_players_by_position
        all_players = @teams.flat_map {|team| team.players}
        all_players.group_by {|player| player.position}
    end
end