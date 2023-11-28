class Centaur
    attr_reader :name, :breed
  
    def initialize(name, breed)
        @name = name
        @breed = breed
    end

    def shoot
        @shoot = @shoot + 1
        "Twang!!!"
    end
   
    def run
        "Clop clop clop clop!"
    end

    def cranky?
        if @shoot <= 3 || @run <= 3
            "false"
        else
            "true"
        end
    end

    def standing?
        space holder
    end
    
end