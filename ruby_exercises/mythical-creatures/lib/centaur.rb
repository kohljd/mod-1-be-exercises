class Centaur
    attr_reader :name, :breed
  
    def initialize(name, breed)
        @name = name
        @breed = breed
        @cranky = 0
    end

    def shoot
        @cranky = @cranky + 1
        "Twang!!!"
    end
   
    def run
        "Clop clop clop clop!"
    end

    def cranky?
        @cranky >= 3
    end

    def standing?
        space holder
    end
    
end