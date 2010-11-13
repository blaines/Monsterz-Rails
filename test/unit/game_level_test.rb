require 'test_helper'

class GameLevelTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GameLevel.new.valid?
  end
end
