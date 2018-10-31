require 'minitest/autorun'
require 'minitest/pride'
require './lib/artist'
require './lib/photograph'
require './lib/curator'
require 'pry'

class CuratorTest < Minitest::Test

  def test_it_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_it_starts_with_zero_artists
    curator = Curator.new
    assert_equal [], curator.artists
  end

  def test_it_starts_with_zero_photographs
    curator = Curator.new
    assert_equal [], curator.photographs
  end

  def test_it_can_add_photos_and_check_the_atrributes
  attributes_1 = {
   id: "1",
   name: "Rue Mouffetard, Paris (Boy with Bottles)",
   artist_id: "1",
   year: "1954"
  }

  attributes_2 = {
   id: "2",
   name: "Moonrise, Hernandez",
   artist_id: "2",
   year: "1941"
 }

    curator = Curator.new
    photo_1 = Photograph.new(attributes_1)
    photo_2 = Photograph.new(attributes_2)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    assert_equal [photo_1, photo_2], curator.photographs
    assert_instance_of Photograph, curator.photographs.first
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name
  end

  def test_it_can_add_artists_and_check_the_atributes
    attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
     }

    attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
     }
    curator = Curator.new
    artist_1 = Artist.new(attributes_1)
    artist_2 = Artist.new(attributes_2)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    assert_equal [artist_1, artist_2], curator.artists
    assert_instance_of Artist, curator.artists.first
    assert_equal "Henri Cartier-Bresson", curator.artists.first.name
  end


end





  # pry(main)> curator.find_artist_by_id("1")
  # #=> #<Artist:0x00007fd3a02a8890 @born="1908", @country="France", @died="2004", @id="1", @name="Henri Cartier-Bresson">
  #
  # pry(main)> curator.find_photograph_by_id("2")
  # #=> #<Photograph:0x00007fd3a1801278 @artist_id="2", @id="2", @name="Moonrise, Hernandez", @year="1941">
