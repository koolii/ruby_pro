require 'minitest/autorun'
require_relative '../lib/deep_freezable'

class DeepeFreezableTest < Minitest::Test
  def test_deep_freeze
    assert DeepFreeable
  end
end