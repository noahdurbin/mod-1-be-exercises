class Potluck

    attr_reader :date,
                :dishes

    def initialize(date)
        @date = date
        @dishes = []
    end

    def add_dish(dish)
        @dishes << dish
    end

    def get_all_from_category(category)
        @dishes.select do |dish|
            dish.category == category
        end
    end

    def menu
        menu_hash = Hash.new { |hash, category| hash[category] = [] }
        @dishes.each do |dish|
          menu_hash[dish.category] << dish.name
        end
        menu_hash
    end

    def ratio(category)
       get_all_from_category(category).count.to_f/@dishes.count * 100
    end
end
