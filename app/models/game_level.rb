class GameLevel
  include Mongoid::Document
  field :order
  field :max_health
  field :max_turns
  field :required_experience
  embedded_in :game, :inverse_of => :game_level
end
