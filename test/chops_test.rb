require 'test_helper'

class ChopsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Chops::VERSION
  end
end
