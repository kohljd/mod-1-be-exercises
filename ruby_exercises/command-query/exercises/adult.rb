
class Adult
    attr_reader :sober

    def initialize
        @sober = 0
    end

    def consume_an_alcoholic_beverage
        @sober = @sober + 1
    end

    def sober?
       @sober <= 2
    end
end