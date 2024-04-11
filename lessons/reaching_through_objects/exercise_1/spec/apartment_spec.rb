require 'rspec'
require_relative '../lib/apartment'
require_relative '../lib/room'

RSpec.describe Apartment do
    before do
        @apartment = Apartment.new
        @bathroom = Room.new("bathroom")
        @bedroom = Room.new("bedroom")
        @kitchen = Room.new("kitchen")
        @laundry = Room.new("laundry")
    end

    it 'an apartment is not rented by default' do
        expect(@apartment.is_rented?).to be(false)
    end

    it 'can have up to 4 rooms' do
        @apartment.rooms << @bathroom
        @apartment.rooms << @bedroom
        @apartment.rooms << @kitchen
        @apartment.rooms << @laundry

        expect(@apartment.rooms.count).to eq(4)
    end

    it 'sorts the rooms alphabetically by name' do
        expect(@apartment.rooms.name).to eq([@bathroom, @bedroom, @kitchen, @office])
    end
end
