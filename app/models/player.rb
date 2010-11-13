class Player
  include Mongoid::Document
  field :name
  field :energy
  embeds_many :characters
end
