require 'test_helper'

class GameRaceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GameRace.new.valid?
  end
end
