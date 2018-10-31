require 'minitest/autorun'
require 'minitest/pride'
require './lib/artist'
require 'pry'

class ArtistTest < Minitest::Test

    def test_it_exists
      attributes = {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      }
      artist = Artist.new(attributes)
      assert_instance_of Artist, artist
    end

end




# pry(main)>
#
# pry(main)>
# #=> #<Artist:0x00007fc2d0a6c080...>
#
# pry(main)> artist.id
# #=> "2"
#
# pry(main)> artist.name
# #=> "Ansel Adams"
#
# pry(main)> artist.born
# #=> "1902"
#
# pry(main)> artist.died
# #=> "1984"
#
# pry(main)> artist.country
# #=> "United States"
