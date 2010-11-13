class Game
  include Mongoid::Document
  field :name
  embeds_many :game_races
  embeds_many :game_levels
  embeds_many :game_characters
end
