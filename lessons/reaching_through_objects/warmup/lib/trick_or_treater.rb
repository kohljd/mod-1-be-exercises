class TrickOrTreater
    attr_reader :bag

    def initialize(costume)
        @costume = costume
        @bag = Bag.new
        @total = 0
    end

    def dressed_up_as
        @costume.style
    end

    def has_candy?
        # @bag.candies.any? 
        !@bag.empty?
    end

    def candy_count
        @bag.candies.count
    end

    def eat
        @bag.candies.pop
    end
end