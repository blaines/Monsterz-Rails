class Game
  include Mongoid::Document
  field :name
  embeds_many :game_races
  embeds_many :game_monsters
  
  def formatted_hash
    z = self.serializable_hash
    z["game_monster_image_prefix"] = "http://monsters.technologyaz.com.s3.amazonaws.com/monsters/game_monster/asset/"
    z["current_epoch"] = Time.now.to_i
    z
  end
end
