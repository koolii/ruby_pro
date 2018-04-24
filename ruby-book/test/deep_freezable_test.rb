require 'minitest/autorun'
# require_relative '../lib/deep_freezable'
require './ruby-book/lib/bank'
require './ruby-book/lib/team'

class DeepeFreezableTest < Minitest::Test
  def test_deep_freeze_to_array
    assert_equal ['Japan', 'US', "India"], Team::COUNTRIES
    assert Team::COUNTRIES.frozen?
    assert Team::COUNTRIES.all? { |country| country.frozen? }
  end
end