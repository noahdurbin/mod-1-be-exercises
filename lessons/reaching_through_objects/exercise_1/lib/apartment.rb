class Apartment

    attr_reader :rooms,
                :rented

    def initialize(rented = false)
        @rooms = []
        @rented = rented
    end

    def is_rented?
       rented == true
    end

    def count
       rooms.count
    end
end
