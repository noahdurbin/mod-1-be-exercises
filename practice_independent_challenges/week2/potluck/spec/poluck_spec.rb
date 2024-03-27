require './lib/potluck.rb'

RSpec.describe Potluck do
    before :each do
        @potluck = Potluck.new("7-13-18")
    end

    it "is an instance of Potluck" do
        expect(@potluck).to be_a Potluck
    end
end