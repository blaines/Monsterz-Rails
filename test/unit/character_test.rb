require 'test_helper'

class MonsterTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Monster.new.valid?
  end
end
