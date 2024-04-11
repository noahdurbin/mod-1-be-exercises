class Bag

    attr_reader :candies

    def initialize()
        @candies = []
    end

    def empty?
        @candies == []
    end

    def count
       candies.count
    end

    def add_candy(candy)
       candies << candy
    end

    def contains?(type_of_candy)
        contains_candy = false
        candies.each do |candy|
            if candy.type.include?(type_of_candy)
                contains_candy = true
            end
        end
        contains_candy
    end
end
