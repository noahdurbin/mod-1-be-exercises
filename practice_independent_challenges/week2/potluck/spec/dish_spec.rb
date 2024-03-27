require './lib/dish.rb'

RSpec.describe Dish do
    before :each do
        @dish = Dish.new("Couscous Salad", :appetizer)
    end

    it "is an instance of Dish" do
        expect(@dish).to be_a Dish
    end

    it "can read the category and name of a dish" do
        expect(@dish.name).to eq("Couscous Salad")
        expect(@dish.category).to eq(:appetizer)
    end
end