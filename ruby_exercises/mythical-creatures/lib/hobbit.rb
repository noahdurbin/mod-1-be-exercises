class Hobbit
    attr_reader :name, 
                :disposition, 
                :age

    def initialize(name, disposition = "homebody")
        @name = name
        @disposition = disposition
        @age = 0
        @height = true
    end

    def celebrate_birthday
        @age += 1
    end

    def adult?
        return false unless @age > 32
        true
    end

    def old?
        return true if @age > 100
        false
    end

    def has_ring?
        return true if @name = "Frodo"
        false
    end

    def is_short?
        @height
    end
end