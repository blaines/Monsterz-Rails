class GameRace
  include Mongoid::Document
  field :name
  embedded_in :game, :inverse_of => :game_race
  references_many :game_monsters
end