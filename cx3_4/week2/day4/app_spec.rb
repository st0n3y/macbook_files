require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( 'app.rb' )


class TestApp < MiniTest::Test

  # def test_module_play
  #   array = Pokemon::Array.new
  #   assert_equal( "Bulbasaur", array.pokemon )
  # end

  # def test_module_capture
  #   array = Pokemon::Array.new
  #   pokeball = array.capture( "Pikachu" )
  #   assert_equal( "Pikachu",  pokeball[0] )
  # end

  # def test_array_only_has_pikachu()
  #   array = Pokemon::Array.new
  #   assert_equal( "Pikachu", array[9] )
  # end

  def test_value_of_pi()
    assert_equal( 100, CrazyMath::PI )
  end

end