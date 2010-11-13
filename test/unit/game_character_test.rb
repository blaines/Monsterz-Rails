require 'test_helper'

class GameCharacterTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GameCharacter.new.valid?
  end
end
