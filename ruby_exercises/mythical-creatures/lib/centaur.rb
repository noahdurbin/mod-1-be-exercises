class Centaur
    attr_reader :name, :breed

    def initialize(name, breed)
        @name = name
        @breed = breed
        @shoot = true
        @cranky = 0
        @standing = true
        @rested = nil
    end

    def shoot
        if cranky? == true
            "NO!"
        elsif @standing == false
            "NO!"
        else @shoot == true
            @cranky += 1
            'Twang!!!'
        end
    end

    def run
        if @standing == false
            "NO!"
        else
            @cranky += 1
            'Clop clop clop clop!'
        end
    end

    def cranky?
        if @cranky >= 3
            true
        else 
            false
        end
    end

    def standing?
        @standing
    end

    def sleep
        if @standing == true
            return "NO!"
        else
            @cranky = 0
            return "sleeping"
        end
    end

    def lay_down
        @standing = false
    end

    def stand_up
        @standing = true
    end  

    def laying?
        if @standing == false
            true
        else
            false
        end
    end
    
    def drinks_potion
        if @rested == true
            "sick"
        else @standing == true
            @rested = true
        end
    end

    def rested 
        @rested = true
    end
end