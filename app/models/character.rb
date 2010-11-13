class Character
  include Mongoid::Document
  field :level
  field :turns
  field :race
  field :health
  field :experience
  embedded_in :player, :inverse_of => :character
end
