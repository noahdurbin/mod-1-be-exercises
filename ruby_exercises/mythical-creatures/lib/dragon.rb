class Dragon
    attr_reader :name, :color, :rider

    def initialize(name, color, rider)
        @name = name 
        @color = color
        @rider = rider
        @hunger = 0
    end

    def hungry?
        return true if @hunger <= 2
        false
    end

    def eat
        @hunger += 1
    end
    
end