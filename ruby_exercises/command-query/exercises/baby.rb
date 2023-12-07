class Baby

    attr_reader :tired

    def initialize
        @tired = true
    end

    def nap
        @tired = false
    end

    def tired?
        @tired
    end
end