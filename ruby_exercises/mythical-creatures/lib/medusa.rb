class Medusa

    attr_reader :name
    attr_accessor :statues

    def initialize(name)
        @name = name
        @statues = []
    end

    def stare(victim)
        victim.stoned = true
        @statues << victim 
    end
    
    def statues
        @statues
    end
end