class Centaur
    attr_reader :name, :breed, :cranky
  
    def initialize(name, breed)
        @name = name
        @breed = breed
        @cranky = 0
        @standing = true
        @laying = false
    end

    def shoot
        @cranky = @cranky + 1
        if cranky? == false && laying? == false
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

    def laying?
        @laying
    end

    def stand_up
        @standing = true
        @laying = false
    end

    def lay_down
        @standing = false
        @laying = true
    end

    def sleep
        @laying = true
        @cranky = 0
        if @standing == true
            "NO!"
        else
            "Nap time :)"
        end
    end
end