class Centaur
    attr_reader :name, :breed, :cranky
  
    def initialize(name, breed)
        @name = name
        @breed = breed
        @cranky = 0
        @standing = true
    end

    def shoot
        @cranky = @cranky + 1
        if cranky? == false
            "Twang!!!"
        else
            "NO!"
        end
    end
   
    def run
        @cranky = @cranky + 1
        if standing? == false
            "NO!"
        else
            "Clop clop clop clop!"
        end
    end

    def cranky?
        @cranky >= 3
    end

    def standing?
        @standing
    end

    def sleep
        words
        "NO!"
    end

    def lay_down
        @standing = false
    end
    
end