class ColoradoLottery
    attr_reader :registered_contestants,
                :winners,
                :current_contestants
    
    def initialize
        @registered_contestants = {}
        @winners = []
        @current_contestants = {}
    end

    def interested_and_18?(contestant, game)
        return false unless contestant.age >=18 && contestant.game_interests.include?(game.name)
        true
    end

    def can_register?(contestant, game)
        return false unless interested_and_18?(contestant,game) == true && (contestant.out_of_state? == false || game.national_drawing? == true)
        true
    end

    def register_contestant(contestant, game)
        if can_register?(contestant, game)
            @registered_contestants[game] ||= []
            @registered_contestants[game] << contestant
        end
    end

    def eligible_contestants(game)
        @registered_contestants[game].select {|contestant| contestant.spending_money >= game.cost}
    end

    def current_contestants
        @registered_contestants.each do |game, contestants|
            @registered_contestants[game] = eligible_contestants(game)
            @registered_contestants[game].each do |contestant|
                contestant.charge(game.cost)
                @current_contestants[game] ||= []
                @current_contestants[game] << contestant.full_name
            end
        end
        @current_contestants
    end
end