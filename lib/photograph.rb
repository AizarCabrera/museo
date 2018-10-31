require 'pry'

class Photograph

  attr_reader :id,:name, :artist_id, :year

  def initialize(attributes)
    @id        = attributes[:id].to_i
    @name      = attributes[:name]
    @artist_id = attributes[:artist_id].to_i
    @year      = attributes[:year]
  end

end
