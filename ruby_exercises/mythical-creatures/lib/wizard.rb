class Wizard

    attr_reader :name
    attr_accessor :bearded

    def initialize(name, bearded: true, rested: true)
        @name = name
        @bearded = bearded
        @rested = rested
        @spell_count = 0
    end

    def bearded?
        @bearded
    end

    def incantation(command)
        "sudo #{command}"
    end

    def rested?
        return true if @spell_count <= 2
        false
    end

    def cast
        @spell_count += 1
        "Magic Missile!"
    end
end