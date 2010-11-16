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
  
  def max_health
    95+(5*level.to_i)
  end
  
  def max_turns
    self.level
  end
  
  def next_level_experience
    self.level**3
  end
  
  def next_level_progress
    1-(((next_level_experience)-(self.experience)).to_f/((self.level**3)-((self.level-1)**3)).to_f).round(2)
  end
  
  def formatted_hash
    z = self.serializable_hash
    z["race"] = race_data.name
    z["player_id"] = player.id
    z["name"] = game_character.name
    z["max_health"] = max_health
    z["max_turns"] = max_turns
    z["image_prefix"] = "http://monsters.technologyaz.com.s3.amazonaws.com/monsters/game_character/asset/"
    z["image_filename"] = game_character.asset_filename
    z["next_level_experience"] = next_level_experience
    z["next_level_progress"] = next_level_progress
    z
  end
  
end
