class Curator

  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end
  
  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def photos_by_artist
    artist_photos = Hash.new { |hash, key| hash[key] = [] }

    @artists.each do |artist|
      @photographs.each do |photo|
        if artist.id == photo.artist_id
          artist_photos[artist] << photo
        end
      end
    end
    artist_photos
  end

  def prolific_artists
    names_of_artists = []
    photos_by_artist.each do |artist, photos|
      if photos.length > 1
        names_of_artists << artist.name
      end
    end
    names_of_artists
  end

  def photos_by_country(country)
    photos = []
    photos_by_artist.each do |artist, photo|
      if artist.country == country
        photos << photo
      end
    end
    photos.flatten
  end
end