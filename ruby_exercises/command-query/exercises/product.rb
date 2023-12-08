class Product
    attr_reader :item, :cost

    def initialize(item, cost)
        @item = item
        @cost = cost
    end
end