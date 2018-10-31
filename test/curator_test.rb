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

  def test_it_can_find_artist_by_id
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
    assert_equal artist_1, curator.find_artist_by_id("1")
    assert_instance_of Artist, curator.find_artist_by_id("1")
  end

  def test_it_can_find_artist_by_id
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
        assert_equal photo_2, curator.find_photograph_by_id("2")
        assert_instance_of Photograph, curator.find_photograph_by_id("2")
  end

  def test_it_can_add_several_artists_and_photographs_and_find_them
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

   attributes_3 = {
    id: "3",
    name: "Identical Twins, Roselle, New Jersey",
    artist_id: "3",
    year: "1967"
    }

   attributes_4 = {
    id: "4",
    name: "Child with Toy Hand Grenade in Central Park",
    artist_id: "3",
    year: "1962"
    }

   attr_1 = {
    id: "1",
    name: "Henri Cartier-Bresson",
    born: "1908",
    died: "2004",
    country: "France"
    }

   attr_2 = {
    id: "2",
    name: "Ansel Adams",
    born: "1902",
    died: "1984",
    country: "United States"
    }

   attr_3 = {
    id: "3",
    name: "Diane Arbus",
    born: "1923",
    died: "1971",
    country: "United States"
    }
   curator = Curator.new
   artist_1 = Artist.new(attr_1)
   artist_2 = Artist.new(attr_2)
   artist_3 = Artist.new(attr_3)
   photo_1 = Photograph.new(attributes_1)
   photo_2 = Photograph.new(attributes_2)
   photo_3 = Photograph.new(attributes_3)
   photo_4 = Photograph.new(attributes_4)
   curator.add_photograph(photo_1)
   curator.add_photograph(photo_2)
   curator.add_photograph(photo_3)
   curator.add_photograph(photo_4)
   curator.add_artist(artist_1)
   curator.add_artist(artist_2)
   curator.add_artist(artist_3)
   diane_arbus = curator.find_artist_by_id("3")
   assert_equal [photo_3, photo_4], curator.find_photographs_by_artist(diane_arbus)
  end

end
