require './lib/potluck.rb'
require './lib/dish.rb'


RSpec.describe Potluck do
    before :each do
        @potluck = Potluck.new("7-13-18")
    end

    it "is an instance of Potluck" do
        expect(@potluck).to be_a Potluck
    end

    it "contains a potluck date" do
        expect(@potluck.date).to eq("7-13-18")
    end

    it "starts with an empty array of dishes" do
        expect(@potluck.dishes).to eq([])
    end

    it "can add dishes to the dishes array" do
        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        @potluck.add_dish(couscous_salad)
        @potluck.add_dish(cocktail_meatballs)

        expect(@potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
        expect(@potluck.dishes.length).to eq(2)
    end

    it "can get all dishes from a category" do
        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)
        @potluck.add_dish(couscous_salad)
        @potluck.add_dish(summer_pizza)
        @potluck.add_dish(roast_pork)
        @potluck.add_dish(cocktail_meatballs)
        @potluck.add_dish(candy_salad)
        
        expect(@potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
        expect(@potluck.get_all_from_category(:entre)).to eq([roast_pork, cocktail_meatballs])
        expect(@potluck.get_all_from_category(:dessert)).to eq([candy_salad])
        expect(@potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
        expect(@potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end
end