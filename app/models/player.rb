class Player
  include Mongoid::Document
  field :name
  field :adrenaline
  embeds_many :characters
end
