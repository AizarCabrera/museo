require 'pry'

class Artist

  attr_reader :id,:name, :born, :died, :country

  def initialize(artist_atributes)
    @id = artist_atributes[:id]
    @name = artist_atributes[:name]
    @born = artist_atributes[:born]
    @died = artist_atributes[:died]
    @country = artist_atributes[:country]
  end
end
