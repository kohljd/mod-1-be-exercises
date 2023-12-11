class Bag
    attr_reader :candies
    
    def initialize
        @candies = []
    end

    def empty?
        @candies.count == 0
    end

    def count
        @candies.count
    end

    def add_candy(candy)
        @candies << candy
    end

    def contains?(type)
        @candies.any? {|candy| candy.type == type}
    end

end