class Player
  include Mongoid::Document
  field :name
  field :adrenaline, :type => Integer
  embeds_many :characters
  
  validates_uniqueness_of :name
end
