class Character
  include Mongoid::Document
  field :level, :type => Integer
  field :turns, :type => Integer
  field :health, :type => Integer
  field :experience, :type => Integer
  field :race
  referenced_in :game_race
  embedded_in :player, :inverse_of => :character
  
  before_save :set_game_race_id
  
  def set_game_race_id
    self.game_race = Game.first.game_races.find race
  end
  
  def game_character
    Game.first.game_characters.where(:min_level.lte => level, :race => race).last
  end
  
  def race_data
    Game.first.game_races.find race
  end
  
end
