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

  def test_it_can_add_photos
  attributes_1 = {
   id: "1",
   name: "Rue Mouffetard, Paris (Boy with Bottles)",
   artist_id: "1",
   year: "1954"
  }

  photo_2 = {
   id: "2",
   name: "Moonrise, Hernandez",
   artist_id: "2",
   year: "1941"
 }

    curator = Curator.new
    photo_1 = Photograph.new(attributes_1)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    assert_equal [photo_1, photo_2], curator.photographs
    assert_instance_of Photograph, curator.photographs.first
  end

end





  # pry(main)> curator.photographs.first
  # #=> #<Photograph:0x00007fd3a10cda60 @artist_id="1", @id="1", @name="Rue Mouffetard, Paris (Boy with Bottles)", @year="1954">
  #
  # pry(main)> curator.photographs.first.name
  # #=> "Rue Mouffetard, Paris (Boy with Bottles)"
  #
  # pry(main)> artist_1 = {
  #   id: "1"
  #   name: "Henri Cartier-Bresson",
  #   born: "1908",
  #   died: "2004",
  #   country: "France"
  # }
  #
  # pry(main)> artist_2 = {
  #   id: "2",
  #   name: "Ansel Adams",
  #   born: "1902",
  #   died: "1984",
  #   country: "United States"
  # }
  #
  # pry(main)> curator.add_artist(artist_1)
  #
  # pry(main)> curator.add_artist(artist_2)
  #
  # pry(main)> curator.artists
  # #=> [#<Artist:0x00007fd3a02a8890...>, #<Artist:0x00007fd3a02d3130...>]
  #
  # pry(main)> curator.artists.first
  # #=> #<Artist:0x00007fd3a02a8890 @born="1908", @country="France", @died="2004", @id="1", @name="Henri Cartier-Bresson">
  #
  # pry(main)> curator.artists.first.name
  # #=> "Henri Cartier-Bresson"
  #
  # pry(main)> curator.find_artist_by_id("1")
  # #=> #<Artist:0x00007fd3a02a8890 @born="1908", @country="France", @died="2004", @id="1", @name="Henri Cartier-Bresson">
  #
  # pry(main)> curator.find_photograph_by_id("2")
  # #=> #<Photograph:0x00007fd3a1801278 @artist_id="2", @id="2", @name="Moonrise, Hernandez", @year="1941">
