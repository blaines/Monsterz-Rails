require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Character.new.valid?
  end
end
