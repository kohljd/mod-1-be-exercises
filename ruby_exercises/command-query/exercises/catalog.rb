require_relative "product"

class Catalog
    attr_reader :product

    def initialize
        @product = product
        @catalog = []
    end

    def cheapest
        @catalog.min
    end
end

p catalog = Catalog.new
p catalog.class
# catalog.push(Product.new('scissors', 8))
# p catalog