require 'curator'
require 'photograph'
require 'artist'

RSpec.describe Curator do
  
  before do
   @curator = Curator.new 
   @photo_1 = Photograph.new({
    id: "1",      
    name: "Rue Mouffetard, Paris (Boy with Bottles)",      
    artist_id: "1",      
    year: "1954"      
  })
  @photo_2 = Photograph.new({
    id: "2",      
    name: "Moonrise, Hernandez",      
    artist_id: "2",      
    year: "1941"      
  })
  @photo_3 = Photograph.new({
    id: "2",      
    name: "beautiful photo",      
    artist_id: "1",      
    year: "1991"      
  })
  @artist_1 = Artist.new({
    id: "1",      
    name: "Henri Cartier-Bresson",      
    born: "1908",      
    died: "2004",      
    country: "France"      
  })
  @artist_2 = Artist.new({
    id: "2",      
    name: "Ansel Adams",      
    born: "1902",      
    died: "1984",      
    country: "United States"      
  })  
  end

  describe 'initialize' do
    it 'can initialize a new curator' do
      expect(@curator).to be_a(Curator)
    end

    it 'has an empty array of photographs to start' do
      expect(@curator.photographs).to eq([])
    end

    it 'has an empty array of artists' do
      expect(@curator.artists).to eq([])
    end
  end

  describe 'curator methods' do
    before do
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2) 
    end
    it 'can add photos to the photographs array' do
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      expect(@curator.photographs).to eq([@photo_1, @photo_2])
    end

    it 'can add artists to the artists array' do
      expect(@curator.artists).to eq([@artist_1, @artist_2])
    end

    it 'can find an artist by their artist id' do
      expect(@curator.find_artist_by_id("1")).to eq(@artist_1)
    end
  end

  describe 'curator lists' do
    before do
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)
    end

    it 'can create a list of artists with their photographs' do
      expected = {
        @artist_1 => [@photo_1, @photo_3],
        @artist_2 => [@photo_2]
      }

      expect(@curator.photos_by_artist).to eq(expected)
    end

    it 'can generate a list of artists with more than one photo' do
      expected = [@artist_1.name]

      expect(@curator.prolific_artists).to eq(expected)
    end

    it 'can generate a list of photos taken by a photographer from a specific country' do
      expected = [@photo_1, @photo_3]

      expect(@curator.photos_by_country('France')).to eq(expected)
    end
  end
end