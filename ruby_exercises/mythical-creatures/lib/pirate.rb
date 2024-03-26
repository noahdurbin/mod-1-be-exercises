class Pirate
    attr_reader :name, :job
     
    def initialize(name, job = 'Scallywag')
        @name = name
        @job = job
        @crime = 0
    end

    def cursed?
        return true if @crime >= 3
        false
    end

    def commit_heinous_act
        @crime += 1
    end
end