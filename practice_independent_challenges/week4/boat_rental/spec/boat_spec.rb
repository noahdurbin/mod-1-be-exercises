require 'boat'

RSpec.describe Boat do
  before do
    @kayak = Boat.new(:kayak, 20)
  end

  describe 'initialize' do
    it 'can generate a boat object' do
      expect(@kayak).to be_a(Boat)
    end

    it 'has readable attributes' do
      expect(@kayak.type).to eq(:kayak)
      expect(@kayak.price_per_hour).to eq(20)
    end

    it 'initializes with an hour counter at 0' do
      expect(@kayak.hours_rented).to eq(0)
    end
  end

  describe 'rented hours' do
    before do
      @kayak.add_hour
      @kayak.add_hour
      @kayak.add_hour
    end

    it 'can count the amount of hours rented' do
      expect(@kayak.hours_rented).to eq(3)
    end
  end
end