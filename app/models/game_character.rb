class GameCharacter
  include Mongoid::Document
  mount_uploader :asset, AssetUploader
  field :name
  field :min_level
  field :race
  embedded_in :game, :inverse_of => :game_character
  referenced_in :game_race
end
