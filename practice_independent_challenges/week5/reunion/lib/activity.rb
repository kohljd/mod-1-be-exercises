class Activity
    attr_reader :name,
                :total_cost,
                :participants

    def initialize(name)
        @name = name
        @total_cost = 0
        @participants = {}
    end

    def add_participant(participant, cost)
        @participants[participant] = cost
        @total_cost += cost
    end
end