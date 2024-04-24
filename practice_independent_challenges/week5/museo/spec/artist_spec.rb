require 'artist'

RSpec.describe Artist do
  before do
    @attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    @artist = Artist.new(@attributes)
  end

  describe 'initialize' do
    it 'can initialize an artist' do 
      expect(@artist).to be_a(Artist)
    end

    it 'has readable attibutes' do
      expect(@artist.id).to eq("2")
      expect(@artist.name).to eq("Ansel Adams")
      expect(@artist.born).to eq("1902")
      expect(@artist.died).to eq("1984")
      expect(@artist.country).to eq("United States")
    end
  end

  describe 'age methods' do
    it 'can calculate the age of an artist at their death' do
      expect(@artist.age_at_death).to eq(82)
    end
  end
end