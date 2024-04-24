require 'dock'
require 'boat'
require 'renter'

RSpec.describe Dock do
  before do
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20) 
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  describe 'initialize' do
    it 'is a dock' do
      expect(@dock).to be_a Dock
    end

    it 'has a name and max rental time' do
      expect(@dock.name).to eq("The Rowing Dock")
      expect(@dock.max_rental_time).to eq(3)
    end

    it 'has an empty rental log' do
      expect(@dock.rental_log).to eq({})
    end
  end

  describe 'rental log' do
    it 'can rent out boats and boards' do
      @dock.rent(@kayak_1, @patrick)

      expect(@dock.rental_log).to eq({@kayak_1 => @patrick})
    end

    it 'can generate a rental log' do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
      expected = ({
        @kayak_1 => @patrick,
        @kayak_2 => @patrick,
        @sup_1 => @eugene
      })

      expect(@dock.rental_log).to eq(expected)
    end
  end

  describe 'charge' do
    it 'can generate a hash of charges' do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
      expected = ({
        :card_number => @patrick.credit_card_number,
        :amount => 20
      })

      expect(@dock.charge(@kayak_1)).to eq(expected)
    end
  end
end