require 'test_helper'

class GameMonsterTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GameMonster.new.valid?
  end
end
