require 'pry'

class Curator

attr_reader :artists, :photographs

  def initialize
    @artists     = []
    @photographs = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(artist_id)
    @artists.find do |artist|
      artist.id == artist_id
    end
  end

  def find_photograph_by_id(photo_id)
    @photographs.find do |photo|
      photo.id == photo_id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

end
