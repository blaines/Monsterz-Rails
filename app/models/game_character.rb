class GameCharacter
  include Mongoid::Document
  mount_uploader :asset, AssetUploader
  field :name
  field :min_level
  embedded_in :game, :inverse_of => :game_character
  references_many :characters
  referenced_in :game_race
end
