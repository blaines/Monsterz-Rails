class GameMonster
  include Mongoid::Document
  mount_uploader :asset, AssetUploader
  field :name
  field :min_level, :type => Integer
  field :race
  embedded_in :game, :inverse_of => :game_monster
  references_many :monsters
  referenced_in :game_race
  
  before_save :set_game_race_id
  
  def set_game_race_id
    self.game_race = self.game.game_races.find race
  end
  
end
